import 'package:dio/dio.dart';

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
    try {
      // 模擬資料，實際實作時會根據不同source進行網路請求和解析
      final List<VideoModel> mockVideos = List.generate(20, (index) {
        return VideoModel(
          id: 'video_${source.name}_${page}_$index',
          title: '示例影片 ${index + 1} - ${source.displayName}',
          thumbnail: 'https://via.placeholder.com/320x180?text=Video+${index + 1}',
          description: '這是來自${source.displayName}的示例影片描述',
          durationInSeconds: 1800 + (index * 120), // 30分鐘加上變化
          tags: ['標籤1', '標籤2', '${source.name}'],
          source: source,
          publishDate: DateTime.now().subtract(Duration(days: index)),
        );
      });
      
      // 模擬網路延遲
      await Future.delayed(const Duration(milliseconds: 500));
      
      return mockVideos;
    } on DioException catch (e) {
      throw ServerException('Network error: ${e.message}');
    } catch (e) {
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
} 