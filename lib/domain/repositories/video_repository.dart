import 'package:dartz/dartz.dart';

import '../entities/video_entity.dart';
import '../entities/video_detail_entity.dart';
import '../../core/enums/video_source.dart';
import '../../core/errors/failures.dart';

abstract class VideoRepository {
  /// 根據資料源獲取影片列表
  Future<Either<Failure, List<VideoEntity>>> getVideosBySource(
    VideoSource source,
    int page, {
    int limit = 20,
  });
  
  /// 獲取影片詳細資訊
  Future<Either<Failure, VideoDetailEntity>> getVideoDetail(
    String videoId,
    VideoSource source,
  );
  
  /// 搜尋影片
  Future<Either<Failure, List<VideoEntity>>> searchVideos(
    String query,
    VideoSource source, {
    int page = 1,
    int limit = 20,
  });
  
  /// 獲取熱門影片
  Future<Either<Failure, List<VideoEntity>>> getPopularVideos(
    VideoSource source, {
    int page = 1,
    int limit = 20,
  });
  
  /// 獲取最新影片
  Future<Either<Failure, List<VideoEntity>>> getLatestVideos(
    VideoSource source, {
    int page = 1,
    int limit = 20,
  });
  
  /// 獲取分類影片
  Future<Either<Failure, List<VideoEntity>>> getVideosByCategory(
    String category,
    VideoSource source, {
    int page = 1,
    int limit = 20,
  });
} 