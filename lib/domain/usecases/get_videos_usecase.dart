import 'package:dartz/dartz.dart';

import '../entities/video_entity.dart';
import '../repositories/video_repository.dart';
import '../../core/enums/video_source.dart';
import '../../core/errors/failures.dart';

class GetVideosUseCase {
  final VideoRepository repository;
  
  GetVideosUseCase(this.repository);
  
  Future<Either<Failure, List<VideoEntity>>> call(
    VideoSource source,
    int page, {
    int limit = 20,
  }) async {
    return await repository.getVideosBySource(source, page, limit: limit);
  }
} 