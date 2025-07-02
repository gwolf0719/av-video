import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/enums/video_source.dart';

// Events
abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationChangedEvent extends NavigationEvent {
  final int selectedIndex;

  const NavigationChangedEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class VideoSourceChangedEvent extends NavigationEvent {
  final VideoSource source;

  const VideoSourceChangedEvent(this.source);

  @override
  List<Object> get props => [source];
}

class NavigationResetEvent extends NavigationEvent {}

// States
abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {
  final int selectedIndex;
  final VideoSource currentSource;

  const NavigationInitial({
    this.selectedIndex = 0,
    this.currentSource = VideoSource.anime,
  });

  @override
  List<Object> get props => [selectedIndex, currentSource];
}

class NavigationUpdated extends NavigationState {
  final int selectedIndex;
  final VideoSource currentSource;
  final bool isLoading;

  const NavigationUpdated({
    required this.selectedIndex,
    required this.currentSource,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [selectedIndex, currentSource, isLoading];

  NavigationUpdated copyWith({
    int? selectedIndex,
    VideoSource? currentSource,
    bool? isLoading,
  }) {
    return NavigationUpdated(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      currentSource: currentSource ?? this.currentSource,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// BLoC
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial()) {
    on<NavigationChangedEvent>(_onNavigationChanged);
    on<VideoSourceChangedEvent>(_onVideoSourceChanged);
    on<NavigationResetEvent>(_onNavigationReset);
  }

  Future<void> _onNavigationChanged(
    NavigationChangedEvent event,
    Emitter<NavigationState> emit,
  ) async {
    final currentState = _getCurrentState();
    
    emit(NavigationUpdated(
      selectedIndex: event.selectedIndex,
      currentSource: currentState.currentSource,
      isLoading: false,
    ));
  }

  Future<void> _onVideoSourceChanged(
    VideoSourceChangedEvent event,
    Emitter<NavigationState> emit,
  ) async {
    final currentState = _getCurrentState();
    
    // 顯示載入狀態
    emit(NavigationUpdated(
      selectedIndex: currentState.selectedIndex,
      currentSource: currentState.currentSource,
      isLoading: true,
    ));

    // 模擬切換資料源的延遲
    await Future.delayed(const Duration(milliseconds: 500));

    // 更新到新的資料源
    emit(NavigationUpdated(
      selectedIndex: currentState.selectedIndex,
      currentSource: event.source,
      isLoading: false,
    ));
  }

  Future<void> _onNavigationReset(
    NavigationResetEvent event,
    Emitter<NavigationState> emit,
  ) async {
    emit(const NavigationInitial());
  }

  // 輔助方法獲取當前狀態
  NavigationUpdated _getCurrentState() {
    if (state is NavigationUpdated) {
      return state as NavigationUpdated;
    } else if (state is NavigationInitial) {
      final initial = state as NavigationInitial;
      return NavigationUpdated(
        selectedIndex: initial.selectedIndex,
        currentSource: initial.currentSource,
      );
    } else {
      return const NavigationUpdated(
        selectedIndex: 0,
        currentSource: VideoSource.anime,
      );
    }
  }

  // 獲取資料源名稱的輔助方法
  String getSourceDisplayName(VideoSource source) {
    switch (source) {
      case VideoSource.anime:
        return '動畫頁籤';
      case VideoSource.limit1:
        return 'LIMIT1中文字幕';
      case VideoSource.chinese1:
        return '中文1中文字幕';
    }
  }

  // 獲取當前選中的資料源
  VideoSource get currentSource {
    final currentState = _getCurrentState();
    return currentState.currentSource;
  }

  // 獲取當前選中的索引
  int get selectedIndex {
    final currentState = _getCurrentState();
    return currentState.selectedIndex;
  }
} 