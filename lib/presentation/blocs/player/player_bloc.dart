import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import '../../../core/enums/video_source.dart';
import '../../../domain/repositories/video_repository.dart';

// Events
abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class PlayerInitializeEvent extends PlayerEvent {
  final String videoId;
  final VideoSource videoSource;
  final String videoTitle;

  const PlayerInitializeEvent({
    required this.videoId,
    required this.videoSource,
    required this.videoTitle,
  });

  @override
  List<Object> get props => [videoId, videoSource, videoTitle];
}

class PlayerPlayEvent extends PlayerEvent {}
class PlayerPauseEvent extends PlayerEvent {}
class PlayerStopEvent extends PlayerEvent {}
class PlayerSeekEvent extends PlayerEvent {
  final Duration position;

  const PlayerSeekEvent(this.position);

  @override
  List<Object> get props => [position];
}

class PlayerVolumeChangeEvent extends PlayerEvent {
  final double volume;

  const PlayerVolumeChangeEvent(this.volume);

  @override
  List<Object> get props => [volume];
}

class PlayerFullscreenToggleEvent extends PlayerEvent {}
class PlayerDisposeEvent extends PlayerEvent {}
class PlayerPositionUpdateEvent extends PlayerEvent {
  final Duration position;

  const PlayerPositionUpdateEvent(this.position);

  @override
  List<Object> get props => [position];
}

// States
abstract class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object> get props => [];
}

class PlayerInitialState extends PlayerState {}

class PlayerLoadingState extends PlayerState {}

class PlayerReadyState extends PlayerState {
  final String title;
  final Duration duration;
  final VideoPlayerController controller;

  const PlayerReadyState({
    required this.title,
    required this.duration,
    required this.controller,
  });

  @override
  List<Object> get props => [title, duration, controller];
}

class PlayerPlayingState extends PlayerState {
  final Duration position;
  final Duration duration;
  final bool isBuffering;
  final VideoPlayerController controller;

  const PlayerPlayingState({
    required this.position,
    required this.duration,
    required this.controller,
    this.isBuffering = false,
  });

  @override
  List<Object> get props => [position, duration, isBuffering, controller];
}

class PlayerPausedState extends PlayerState {
  final Duration position;
  final Duration duration;
  final VideoPlayerController controller;

  const PlayerPausedState({
    required this.position,
    required this.duration,
    required this.controller,
  });

  @override
  List<Object> get props => [position, duration, controller];
}

class PlayerErrorState extends PlayerState {
  final String message;

  const PlayerErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class PlayerEndedState extends PlayerState {
  final VideoPlayerController controller;

  const PlayerEndedState({required this.controller});

  @override
  List<Object> get props => [controller];
}

// BLoC
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final VideoRepository videoRepository;
  VideoPlayerController? _controller;
  Timer? _progressTimer;

  PlayerBloc({
    required this.videoRepository,
  }) : super(PlayerInitialState()) {
    on<PlayerInitializeEvent>(_onInitialize);
    on<PlayerPlayEvent>(_onPlay);
    on<PlayerPauseEvent>(_onPause);
    on<PlayerStopEvent>(_onStop);
    on<PlayerSeekEvent>(_onSeek);
    on<PlayerVolumeChangeEvent>(_onVolumeChange);
    on<PlayerFullscreenToggleEvent>(_onFullscreenToggle);
    on<PlayerDisposeEvent>(_onDispose);
    on<PlayerPositionUpdateEvent>(_onPositionUpdate);
  }

  Future<void> _onInitialize(
    PlayerInitializeEvent event,
    Emitter<PlayerState> emit,
  ) async {
    try {
      emit(PlayerLoadingState());
      
      // 先獲取影片詳情來得到實際的播放URL
      final result = await videoRepository.getVideoDetail(
        event.videoId,
        event.videoSource,
      );
      
      await result.fold(
        (failure) async {
          emit(PlayerErrorState('無法載入影片詳情: ${failure.toString()}'));
        },
        (videoDetail) async {
          final playUrl = videoDetail.video.playUrl;
          if (playUrl == null || playUrl.isEmpty) {
            emit(PlayerErrorState('影片播放地址不存在'));
            return;
          }
          
          // 現在用實際的播放URL初始化VideoPlayerController
          _controller = VideoPlayerController.networkUrl(Uri.parse(playUrl));
          
          try {
            await _controller!.initialize();
            
            if (_controller!.value.hasError) {
              emit(PlayerErrorState('影片初始化失敗: ${_controller!.value.errorDescription}'));
              return;
            }
            
            emit(PlayerReadyState(
              controller: _controller!,
              title: event.videoTitle,
              duration: _controller!.value.duration,
            ));
            
            // 開始定時更新進度
            _startProgressTimer();
            
          } catch (e) {
            emit(PlayerErrorState('影片載入失敗: $e'));
          }
        },
      );
    } catch (e) {
      emit(PlayerErrorState('初始化播放器失敗: $e'));
    }
  }

  void _onPlayerStateChanged() {
    if (_controller == null) return;

    final value = _controller!.value;
    
    if (value.hasError) {
      add(PlayerDisposeEvent());
      return;
    }

    if (value.position == value.duration && value.duration > Duration.zero) {
      // 播放結束
      _stopProgressTimer();
    }
  }

  Future<void> _onPlay(
    PlayerPlayEvent event,
    Emitter<PlayerState> emit,
  ) async {
    if (_controller == null) return;
    
    try {
      await _controller!.play();
      _startProgressTimer();
      
      emit(PlayerPlayingState(
        position: _controller!.value.position,
        duration: _controller!.value.duration,
        controller: _controller!,
        isBuffering: _controller!.value.isBuffering,
      ));
    } catch (e) {
      emit(PlayerErrorState('播放失敗: ${e.toString()}'));
    }
  }

  Future<void> _onPause(
    PlayerPauseEvent event,
    Emitter<PlayerState> emit,
  ) async {
    if (_controller == null) return;
    
    try {
      await _controller!.pause();
      _stopProgressTimer();
      
      emit(PlayerPausedState(
        position: _controller!.value.position,
        duration: _controller!.value.duration,
        controller: _controller!,
      ));
    } catch (e) {
      emit(PlayerErrorState('暫停失敗: ${e.toString()}'));
    }
  }

  Future<void> _onStop(
    PlayerStopEvent event,
    Emitter<PlayerState> emit,
  ) async {
    if (_controller == null) return;
    
    try {
      await _controller!.pause();
      await _controller!.seekTo(Duration.zero);
      _stopProgressTimer();
      
      emit(PlayerPausedState(
        position: Duration.zero,
        duration: _controller!.value.duration,
        controller: _controller!,
      ));
    } catch (e) {
      emit(PlayerErrorState('停止失敗: ${e.toString()}'));
    }
  }

  Future<void> _onSeek(
    PlayerSeekEvent event,
    Emitter<PlayerState> emit,
  ) async {
    if (_controller == null) return;
    
    try {
      await _controller!.seekTo(event.position);
      
      if (_controller!.value.isPlaying) {
        emit(PlayerPlayingState(
          position: event.position,
          duration: _controller!.value.duration,
          controller: _controller!,
        ));
      } else {
        emit(PlayerPausedState(
          position: event.position,
          duration: _controller!.value.duration,
          controller: _controller!,
        ));
      }
    } catch (e) {
      emit(PlayerErrorState('跳轉失敗: ${e.toString()}'));
    }
  }

  void _onVolumeChange(
    PlayerVolumeChangeEvent event,
    Emitter<PlayerState> emit,
  ) {
    if (_controller == null) return;
    
    try {
      _controller!.setVolume(event.volume);
    } catch (e) {
      emit(PlayerErrorState('音量調整失敗: ${e.toString()}'));
    }
  }

  void _onFullscreenToggle(
    PlayerFullscreenToggleEvent event,
    Emitter<PlayerState> emit,
  ) {
    // 全螢幕切換邏輯
    // 這裡可以添加全螢幕相關的系統UI控制
  }

  Future<void> _onDispose(
    PlayerDisposeEvent event,
    Emitter<PlayerState> emit,
  ) async {
    _stopProgressTimer();
    await _controller?.dispose();
    _controller = null;
    emit(PlayerInitialState());
  }

  void _onPositionUpdate(
    PlayerPositionUpdateEvent event,
    Emitter<PlayerState> emit,
  ) {
    if (_controller == null) return;
    
    if (_controller!.value.isPlaying) {
      emit(PlayerPlayingState(
        position: event.position,
        duration: _controller!.value.duration,
        controller: _controller!,
        isBuffering: _controller!.value.isBuffering,
      ));
    }
  }

  void _startProgressTimer() {
    _stopProgressTimer();
    _progressTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_controller?.value.isPlaying == true) {
        add(PlayerPositionUpdateEvent(_controller!.value.position));
      }
    });
  }

  void _stopProgressTimer() {
    _progressTimer?.cancel();
    _progressTimer = null;
  }

  @override
  Future<void> close() {
    _stopProgressTimer();
    _controller?.dispose();
    return super.close();
  }
} 