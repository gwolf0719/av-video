part of 'video_bloc.dart';

@freezed
class VideoEvent with _$VideoEvent {
  const factory VideoEvent.loadVideos(VideoSource source, int page) = LoadVideos;
  const factory VideoEvent.refreshVideos(VideoSource source) = RefreshVideos;
  const factory VideoEvent.loadMoreVideos(VideoSource source, int page) = LoadMoreVideos;
  const factory VideoEvent.searchVideos(String query, VideoSource source) = SearchVideos;
  const factory VideoEvent.changeSource(VideoSource source) = ChangeSource;
} 