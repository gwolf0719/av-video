import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html_parser;
// 導入 html/dom.dart 以便使用 Element 類型，雖然在此範例中不直接用到，但良好習慣
// import 'package:html/dom.dart'; 

import '../models/video_model.dart';
import '../../core/enums/video_source.dart';
import '../../core/enums/video_quality.dart';
import '../../core/errors/exceptions.dart';
import 'dart:math' as math;

abstract class VideoRemoteDataSource {
  Future<List<VideoModel>> getVideosBySource(VideoSource source, int page);
  Future<VideoDetailModel> getVideoDetail(String videoId, VideoSource source);
}

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  final Dio dio;
  
  VideoRemoteDataSourceImpl(this.dio);
  
  @override
  Future<List<VideoModel>> getVideosBySource(VideoSource source, int page) async {
    // 建立目標 URL
    final targetUrl = '${source.baseUrl}$page.html';
    
    // 添加調試資訊
    print('🔍 VideoRemoteDataSource.getVideosBySource:');
    print('   Source: ${source.displayName} (${source.name})');
    print('   BaseURL: ${source.baseUrl}');
    print('   TargetURL: $targetUrl');
    
    try {
      // 1. 發起網路請求取得 HTML
      final response = await dio.get(targetUrl);
      
      if (response.statusCode == 200) {
        // 2. 使用共用的解析器來解析 HTML
        return _parseVideoList(response.data, source);
      } else {
        throw ServerException('Failed to load videos: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // 處理 Dio 的錯誤，例如超時、無網路等
      throw ServerException('Network error: ${e.message}');
    } catch (e) {
      // 處理其他所有錯誤，包括解析錯誤
      throw ParsingException('Failed to parse video list: $e');
    }
  }
  
  @override
  Future<VideoDetailModel> getVideoDetail(String videoId, VideoSource source) async {
    try {
      // 建立影片詳情頁面URL - 這裡需要根據實際網站結構調整
      final detailUrl = '${source.baseUrl.replaceAll('_list/all/', '')}/$videoId/content.html';
      
      final response = await dio.get(detailUrl);
      
      if (response.statusCode == 200) {
        return _parseVideoDetailPage(response.data, videoId, source);
      } else {
        throw ServerException('Failed to load video detail: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerException('Network error: ${e.message}');
    } catch (e) {
      throw ParsingException('Failed to parse video detail: $e');
    }
  }

  // 解析影片詳情頁面
  VideoDetailModel _parseVideoDetailPage(String htmlContent, String videoId, VideoSource source) {
    final document = html_parser.parse(htmlContent);
    
    // 解析影片標題
    final titleElement = document.querySelector('h1') ?? document.querySelector('.title');
    final title = titleElement?.text.trim() ?? '未知標題';
    
    // 解析影片描述
    final descElement = document.querySelector('.description') ?? document.querySelector('.content');
    final description = descElement?.text.trim() ?? '';
    
    // 解析縮圖
    final imgElement = document.querySelector('img.main-image') ?? document.querySelector('figure img');
    final thumbnail = imgElement?.attributes['src'] ?? '';
    
    // 解析實際的播放URL - 這裡需要根據網站的實際結構來調整
    String? playUrl;
    
    // 尋找影片播放連結的常見模式
    final videoSources = document.querySelectorAll('video source');
    if (videoSources.isNotEmpty) {
      playUrl = videoSources.first.attributes['src'];
    } else {
      // 尋找其他可能的影片連結模式
      final linkElements = document.querySelectorAll('a[href*=".mp4"], a[href*=".m3u8"], a[href*="video"]');
      if (linkElements.isNotEmpty) {
        playUrl = linkElements.first.attributes['href'];
      }
    }
    
    // 如果找不到播放URL，拋出錯誤
    if (playUrl == null || playUrl.isEmpty) {
      throw ParsingException('Could not find video play URL for video: $videoId');
    }
    
    // 確保URL是完整的
    if (playUrl.startsWith('/')) {
      final uri = Uri.parse(source.baseUrl);
      playUrl = '${uri.scheme}://${uri.host}$playUrl';
    }
    
    final video = VideoModel(
      id: videoId,
      title: title,
      thumbnail: thumbnail.startsWith('/') ? 
        '${Uri.parse(source.baseUrl).origin}$thumbnail' : thumbnail,
      description: description,
      durationInSeconds: 0, // 需要從實際影片中獲取，或從頁面解析
      tags: [source.displayName],
      source: source,
      playUrl: playUrl,
      publishDate: DateTime.now(), // 可以從頁面解析實際發布時間
    );
    
    final videoDetail = VideoDetailModel(
      video: video,
      availableQualities: [VideoQuality.auto], // 可以從實際數據中解析
      subtitles: [], // 可以從頁面解析字幕信息
      relatedVideos: [], // 可以解析相關影片
      playUrls: {
        'Auto': playUrl,
      },
      viewCount: null,
      rating: null,
    );
    
    return videoDetail;
  }

  // 3. 實作共用的解析方法 (爬蟲規則)
  List<VideoModel> _parseVideoList(String htmlContent, VideoSource source) {
    final document = html_parser.parse(htmlContent);
    final videoElements = document.querySelectorAll('div.post');
    final List<VideoModel> videos = [];

    print('📄 _parseVideoList:');
    print('   Source: ${source.displayName}');
    print('   Found ${videoElements.length} video elements');

    for (int i = 0; i < videoElements.length; i++) {
      final element = videoElements[i];
      try {
        final aTag = element.querySelector('h3 > a');
        final videoPageUrl = aTag?.attributes['href'] ?? '';
        final title = aTag?.text.trim() ?? '未知標題';
        
        final imgTag = element.querySelector('figure > a > img');
        final thumbnailUrl = imgTag?.attributes['src'] ?? '';
        
        final metaTag = element.querySelector('div.meta');
        final date = metaTag?.text.trim() ?? '';
        
        // 提取影片ID
        final urlParts = videoPageUrl.split('/').where((s) => s.isNotEmpty).toList();
        final id = urlParts.length > 1 ? urlParts[urlParts.length - 2] : '${source.id}_$i';

        // 確保URL是完整的
        String fullVideoPageUrl = videoPageUrl;
        if (videoPageUrl.startsWith('/')) {
          final uri = Uri.parse(source.baseUrl);
          fullVideoPageUrl = '${uri.scheme}://${uri.host}$videoPageUrl';
        }
        
        String fullThumbnailUrl = thumbnailUrl;
        if (thumbnailUrl.startsWith('/')) {
          final uri = Uri.parse(source.baseUrl);
          fullThumbnailUrl = '${uri.scheme}://${uri.host}$thumbnailUrl';
        }

        videos.add(
          VideoModel(
            id: id,
            title: title,
            thumbnail: fullThumbnailUrl,
            description: title,
            durationInSeconds: 0, // 將在詳情頁面獲取
            tags: [source.displayName],
            source: source,
            playUrl: fullVideoPageUrl, // 這裡存儲頁面URL，實際播放URL在詳情中獲取
            publishDate: DateTime.tryParse(date.replaceAll('/', '-')) ?? DateTime.now(),
          ),
        );
        
        // 顯示前3個影片的標題作為調試
        if (i < 3) {
          print('   Video $i: $title (Source: ${source.displayName})');
        }
      } catch (e) {
        print('Error parsing video element $i: $e');
        continue; // 跳過錯誤的元素，繼續處理其他的
      }
    }
    
    print('✅ Successfully parsed ${videos.length} videos from ${source.displayName}'); 
    return videos;
  }

  // 輔助方法：將 "HH:mm:ss" 或 "mm:ss" 格式的字串轉為秒數
  int _parseDuration(String durationStr) {
    try {
      final parts = durationStr.split(':').map((e) => int.tryParse(e) ?? 0).toList();
      if (parts.length == 3) { // HH:mm:ss
        return parts[0] * 3600 + parts[1] * 60 + parts[2];
      } else if (parts.length == 2) { // mm:ss
        return parts[0] * 60 + parts[1];
      }
      return 0;
    } catch (e) {
      return 0;
    }
  }
}