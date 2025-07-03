import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html_parser;
// 導入 html/dom.dart 以便使用 Element 類型，雖然在此範例中不直接用到，但良好習慣
// import 'package:html/dom.dart'; 

import '../models/video_model.dart';
import '../../core/enums/video_source.dart';
import '../../core/enums/video_quality.dart';
import '../../core/errors/exceptions.dart';

abstract class VideoRemoteDataSource {
  Future<List<VideoModel>> getVideosBySource(VideoSource source, int page);
  Future<VideoDetailModel> getVideoDetail(String videoId, VideoSource source);
}

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  final Dio dio;
  
  VideoRemoteDataSourceImpl(this.dio);
  
  @override
  Future<List<VideoModel>> getVideosBySource(VideoSource source, int page) async {
    // 爲了避免 chinese1.example.com 報錯，我們先對它做特殊處理返回空列表
    if (source == VideoSource.chinese1) {
      print('Chinese1 source is not implemented yet, returning empty list.');
      return [];
    }

    // 建立目標 URL
    final targetUrl = '${source.baseUrl}$page.html';
    
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
      // 模擬影片詳情資料
      final video = VideoModel(
        id: videoId,
        title: '詳細影片標題 - $videoId',
        thumbnail: 'https://via.placeholder.com/640x360?text=Video+Detail',
        description: '這是影片的詳細描述，包含更多資訊和內容說明。',
        durationInSeconds: 3600, // 1小時
        tags: ['高畫質', '熱門', source.displayName],
        source: source,
        playUrl: 'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4',
        publishDate: DateTime.now().subtract(const Duration(days: 1)),
      );
      
      final videoDetail = VideoDetailModel(
        video: video,
        availableQualities: [
          VideoQuality.auto,
          VideoQuality.p720,
          VideoQuality.p1080,
        ],
        subtitles: [],
        relatedVideos: [],
        playUrls: {
          'Auto': 'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4',
          '720p': 'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4',
          '1080p': 'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4',
        },
        viewCount: 12345,
        rating: 4.5,
      );
      
      // 模擬網路延遲
      await Future.delayed(const Duration(milliseconds: 800));
      
      return videoDetail;
    } on DioException catch (e) {
      throw ServerException('Network error: ${e.message}');
    } catch (e) {
      throw ParsingException('Failed to parse video detail: $e');
    }
  }

  // 3. 實作共用的解析方法 (爬蟲規則)
  List<VideoModel> _parseVideoList(String htmlContent, VideoSource source) {
  final document = html_parser.parse(htmlContent);
  final videoElements = document.querySelectorAll('div.post');
  final List<VideoModel> videos = [];

  for (final element in videoElements) {
    try {
      final aTag = element.querySelector('h3 > a');
      final videoPageUrl = aTag?.attributes['href'] ?? '';
      final title = aTag?.text.trim() ?? '未知標題';
      
      final imgTag = element.querySelector('figure > a > img');
      final thumbnailUrl = imgTag?.attributes['src'] ?? '';
      
      final metaTag = element.querySelector('div.meta');
      final date = metaTag?.text.trim() ?? '';
      
      // *** 修正 ID 提取邏輯 ***
      // 從 "https://.../55749/content.html" 中提取 "55749"
      final urlParts = videoPageUrl.split('/').where((s) => s.isNotEmpty).toList();
      final id = urlParts.length > 1 ? urlParts[urlParts.length - 2] : videoPageUrl;

      videos.add(
        VideoModel(
          id: id, // 使用修正後的唯一 ID
          title: title,
          thumbnail: thumbnailUrl,
          description: title,
          durationInSeconds: 0,
          tags: [source.displayName],
          source: source,
          playUrl: videoPageUrl,
          publishDate: DateTime.tryParse(date.replaceAll('/', '-')) ?? DateTime.now(),
        ),
      );
    } catch (e) {
      print('Error parsing a video element: $e');
    }
  }
  
  // 驗證 log，確認 videos 是否有內容
  print('Parsed ${videos.length} videos from source: ${source.name}'); 
  print(videos);
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