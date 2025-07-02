import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/video_entity.dart';
import '../../domain/entities/video_detail_entity.dart';
import '../../domain/repositories/video_repository.dart';
import '../../core/enums/video_source.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/exceptions.dart';
import '../datasources/video_remote_data_source.dart';
import '../datasources/video_local_data_source.dart';
import '../models/video_model.dart';

@Injectable(as: VideoRepository)
class VideoRepositoryImpl implements VideoRepository {
  final VideoRemoteDataSource remoteDataSource;
  final VideoLocalDataSource localDataSource;
  
  VideoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  
  @override
  Future<Either<Failure, List<VideoEntity>>> getVideosBySource(
    VideoSource source,
    int page, {
    int limit = 20,
  }) async {
    try {
      final videoModels = await remoteDataSource.getVideosBySource(source, page);
      final videoEntities = videoModels.map((model) => model.toEntity()).toList();
      
      // 快取資料到本地
      await localDataSource.cacheVideos(videoModels, source, page);
      
      return Right(videoEntities);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      // 網路錯誤時嘗試從快取載入
      try {
        final cachedVideoModels = await localDataSource.getCachedVideos(source, page);
        final videoEntities = cachedVideoModels.map((model) => model.toEntity()).toList();
        return Right(videoEntities);
      } on CacheException {
        return Left(NetworkFailure(e.message));
      }
    } on ParsingException catch (e) {
      return Left(ParsingFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, VideoDetailEntity>> getVideoDetail(
    String videoId,
    VideoSource source,
  ) async {
    try {
      final videoDetailModel = await remoteDataSource.getVideoDetail(videoId, source);
      final videoDetailEntity = videoDetailModel.toEntity();
      
      // 快取詳情資料
      await localDataSource.cacheVideoDetail(videoDetailModel);
      
      return Right(videoDetailEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      // 網路錯誤時嘗試從快取載入
      try {
        final cachedDetailModel = await localDataSource.getCachedVideoDetail(videoId);
        if (cachedDetailModel != null) {
          return Right(cachedDetailModel.toEntity());
        }
        return Left(NetworkFailure(e.message));
      } on CacheException {
        return Left(NetworkFailure(e.message));
      }
    } on ParsingException catch (e) {
      return Left(ParsingFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<VideoEntity>>> searchVideos(
    String query,
    VideoSource source, {
    int page = 1,
    int limit = 20,
  }) async {
    if (query.length < 2) {
      return const Left(ValidationFailure('搜尋關鍵字至少需要2個字符'));
    }
    
    try {
      // 搜尋功能需要根據各個資料源的API來實作
      // 目前先返回空列表
      return const Right([]);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<VideoEntity>>> getPopularVideos(
    VideoSource source, {
    int page = 1,
    int limit = 20,
  }) async {
    // 熱門影片邏輯 - 可以根據觀看次數或評分排序
    return getVideosBySource(source, page, limit: limit);
  }
  
  @override
  Future<Either<Failure, List<VideoEntity>>> getLatestVideos(
    VideoSource source, {
    int page = 1,
    int limit = 20,
  }) async {
    // 最新影片邏輯 - 按發布時間排序
    return getVideosBySource(source, page, limit: limit);
  }
  
  @override
  Future<Either<Failure, List<VideoEntity>>> getVideosByCategory(
    String category,
    VideoSource source, {
    int page = 1,
    int limit = 20,
  }) async {
    // 分類影片邏輯 - 根據標籤或分類過濾
    return getVideosBySource(source, page, limit: limit);
  }
} 