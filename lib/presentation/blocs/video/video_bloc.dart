import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/video_entity.dart';
import '../../../domain/usecases/get_videos_usecase.dart';
import '../../../core/enums/video_source.dart';
import '../../../core/errors/failures.dart';

part 'video_event.dart';
part 'video_state.dart';
part 'video_bloc.freezed.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetVideosUseCase getVideosUseCase;
  
  VideoBloc({
    required this.getVideosUseCase,
  }) : super(const VideoState.initial()) {
    on<VideoEvent>((event, emit) async {
      await event.when(
        loadVideos: (source, page) => _onLoadVideos(emit, source, page),
        refreshVideos: (source) => _onRefreshVideos(emit, source),
        loadMoreVideos: (source, page) => _onLoadMoreVideos(emit, source, page),
        searchVideos: (query, source) => _onSearchVideos(emit, query, source),
        changeSource: (source) => _onChangeSource(emit, source),
      );
    });
  }
  
  Future<void> _onLoadVideos(
    Emitter<VideoState> emit,
    VideoSource source,
    int page,
  ) async {
      // 1. BLoC 會先發出 "載入中" 的狀態
    emit(const VideoState.loading());
    
    // 2. 呼叫 getVideosUseCase 取得影片資料
    final result = await getVideosUseCase(source, page);
    
    // 3. 處理結果
    result.fold(
      (failure) => emit(VideoState.error(_mapFailureToMessage(failure))),
      (videos) => emit(VideoState.loaded(
        videos: videos,
        currentSource: source,
        currentPage: page,
        hasReachedMax: videos.length < 20,
      )),
    );
  }
  
  Future<void> _onRefreshVideos(
    Emitter<VideoState> emit,
    VideoSource source,
  ) async {
    // 1. BLoC 會先發出 "載入中" 的狀態
    emit(const VideoState.loading());
    
    // 2. 呼叫 getVideosUseCase 取得影片資料
    final result = await getVideosUseCase(source, 1);
    
    // 3. 處理結果
    result.fold(
      (failure) => emit(VideoState.error(_mapFailureToMessage(failure))),
      (videos) => emit(VideoState.loaded(
        videos: videos,
        currentSource: source,
        currentPage: 1,
        hasReachedMax: videos.length < 20,
      )),
    );
  }
  
  Future<void> _onLoadMoreVideos(
    Emitter<VideoState> emit,
    VideoSource source,
    int page,
  ) async {
    final currentState = state;
    if (currentState is VideoLoaded && !currentState.hasReachedMax) {
      emit(currentState.copyWith(isLoadingMore: true));
      
      final result = await getVideosUseCase(source, page);
      
      result.fold(
        (failure) => emit(currentState.copyWith(
          isLoadingMore: false,
          error: _mapFailureToMessage(failure),
        )),
        (newVideos) {
          final updatedVideos = [...currentState.videos, ...newVideos];
          emit(VideoState.loaded(
            videos: updatedVideos,
            currentSource: source,
            currentPage: page,
            hasReachedMax: newVideos.length < 20,
            isLoadingMore: false,
          ));
        },
      );
    }
  }
  
  Future<void> _onSearchVideos(
    Emitter<VideoState> emit,
    String query,
    VideoSource source,
  ) async {
    if (query.isEmpty) {
      add(VideoEvent.loadVideos(source, 1));
      return;
    }
    
    emit(const VideoState.loading());
    
    // 搜尋功能暫時未實作，先顯示空結果
    emit(const VideoState.loaded(
      videos: [],
      currentSource: VideoSource.anime,
      currentPage: 1,
      hasReachedMax: true,
    ));
  }
  
  Future<void> _onChangeSource(
    Emitter<VideoState> emit,
    VideoSource source,
  ) async {
    add(VideoEvent.loadVideos(source, 1));
  }
  
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return '伺服器錯誤，請稍後再試';
      case NetworkFailure:
        return '網路連線錯誤，請檢查網路設定';
      case CacheFailure:
        return '本地快取錯誤';
      case ParsingFailure:
        return '資料解析錯誤';
      case ValidationFailure:
        return '輸入驗證錯誤';
      case AgeVerificationFailure:
        return '需要年齡驗證';
      default:
        return '發生未知錯誤';
    }
  }
} 