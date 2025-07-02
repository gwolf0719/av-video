import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class PlayerInitializeEvent extends PlayerEvent {
  final String videoUrl;
  final String videoTitle;

  const PlayerInitializeEvent({
    required this.videoUrl,
    required this.videoTitle,
  });

  @override
  List<Object> get props => [videoUrl, videoTitle];
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

// States
abstract class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object> get props => [];
}

class PlayerInitialState extends PlayerState {}

class PlayerLoadingState extends PlayerState {}

class PlayerReadyState extends PlayerState {
  final String videoUrl;
  final String videoTitle;
  final Duration duration;

  const PlayerReadyState({
    required this.videoUrl,
    required this.videoTitle,
    required this.duration,
  });

  @override
  List<Object> get props => [videoUrl, videoTitle, duration];
}

class PlayerPlayingState extends PlayerState {
  final Duration position;
  final Duration duration;
  final bool isBuffering;

  const PlayerPlayingState({
    required this.position,
    required this.duration,
    this.isBuffering = false,
  });

  @override
  List<Object> get props => [position, duration, isBuffering];
}

class PlayerPausedState extends PlayerState {
  final Duration position;
  final Duration duration;

  const PlayerPausedState({
    required this.position,
    required this.duration,
  });

  @override
  List<Object> get props => [position, duration];
}

class PlayerErrorState extends PlayerState {
  final String message;

  const PlayerErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class PlayerEndedState extends PlayerState {}

// BLoC
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerInitialState()) {
    on<PlayerInitializeEvent>(_onInitialize);
    on<PlayerPlayEvent>(_onPlay);
    on<PlayerPauseEvent>(_onPause);
    on<PlayerStopEvent>(_onStop);
    on<PlayerSeekEvent>(_onSeek);
    on<PlayerVolumeChangeEvent>(_onVolumeChange);
    on<PlayerFullscreenToggleEvent>(_onFullscreenToggle);
    on<PlayerDisposeEvent>(_onDispose);
  }

  Future<void> _onInitialize(
    PlayerInitializeEvent event,
    Emitter<PlayerState> emit,
  ) async {
    emit(PlayerLoadingState());
    
    try {
      // 這裡應該初始化實際的影片播放器
      // 例如: await _videoPlayerController.initialize();
      
      await Future.delayed(const Duration(seconds: 1)); // 模擬初始化時間
      
      emit(PlayerReadyState(
        videoUrl: event.videoUrl,
        videoTitle: event.videoTitle,
        duration: const Duration(minutes: 30), // 示例時長
      ));
    } catch (e) {
      emit(PlayerErrorState('影片初始化失敗: ${e.toString()}'));
    }
  }

  Future<void> _onPlay(
    PlayerPlayEvent event,
    Emitter<PlayerState> emit,
  ) async {
    if (state is PlayerReadyState || state is PlayerPausedState) {
      // 這裡應該調用實際的播放邏輯
      emit(const PlayerPlayingState(
        position: Duration.zero,
        duration: Duration(minutes: 30),
      ));
    }
  }

  Future<void> _onPause(
    PlayerPauseEvent event,
    Emitter<PlayerState> emit,
  ) async {
    if (state is PlayerPlayingState) {
      final currentState = state as PlayerPlayingState;
      emit(PlayerPausedState(
        position: currentState.position,
        duration: currentState.duration,
      ));
    }
  }

  Future<void> _onStop(
    PlayerStopEvent event,
    Emitter<PlayerState> emit,
  ) async {
    // 停止播放並重置到初始狀態
    emit(PlayerInitialState());
  }

  Future<void> _onSeek(
    PlayerSeekEvent event,
    Emitter<PlayerState> emit,
  ) async {
    // 實作播放進度跳轉邏輯
  }

  Future<void> _onVolumeChange(
    PlayerVolumeChangeEvent event,
    Emitter<PlayerState> emit,
  ) async {
    // 實作音量調整邏輯
  }

  Future<void> _onFullscreenToggle(
    PlayerFullscreenToggleEvent event,
    Emitter<PlayerState> emit,
  ) async {
    // 實作全螢幕切換邏輯
  }

  Future<void> _onDispose(
    PlayerDisposeEvent event,
    Emitter<PlayerState> emit,
  ) async {
    // 清理播放器資源
    emit(PlayerInitialState());
  }
} 