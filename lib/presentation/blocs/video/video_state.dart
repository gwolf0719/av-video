part of 'video_bloc.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState.initial() = VideoInitial;
  
  const factory VideoState.loading() = VideoLoading;
  
  const factory VideoState.loaded({
    required List<VideoEntity> videos,
    required VideoSource currentSource,
    required int currentPage,
    required bool hasReachedMax,
    @Default(false) bool isLoadingMore,
    String? error,
  }) = VideoLoaded;
  
  const factory VideoState.error(String message) = VideoError;
} 