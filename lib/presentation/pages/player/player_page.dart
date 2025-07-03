import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import '../../blocs/player/player_bloc.dart';
import '../../../core/enums/video_source.dart';

class PlayerPage extends StatefulWidget {
  final String videoId;
  final VideoSource videoSource;
  final String videoTitle;

  const PlayerPage({
    Key? key,
    required this.videoId,
    required this.videoSource,
    required this.videoTitle,
  }) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool _isControlsVisible = true;
  bool _isFullscreen = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
    _setupSystemUI();
  }

  @override
  void dispose() {
    _restoreSystemUI();
    context.read<PlayerBloc>().add(PlayerDisposeEvent()); // ✨ 新增：離開頁面時清理播放器資源
    super.dispose();
  }

  void _initializePlayer() {
    // 如果videoUrl是網頁URL，需要先獲取影片詳情來得到真正的播放URL
    context.read<PlayerBloc>().add(
          PlayerInitializeEvent(
            videoId: widget.videoId,
            videoSource: widget.videoSource,
            videoTitle: widget.videoTitle,
          ),
        );
  }

  void _setupSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _restoreSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _toggleControls() {
    setState(() {
      _isControlsVisible = !_isControlsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<PlayerBloc, PlayerState>(
        listener: (context, state) {
          if (state is PlayerErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: _toggleControls,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 影片播放區域
                  _buildVideoPlayer(state),
                  // 控制介面
                  if (_isControlsVisible) _buildControlsOverlay(state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(PlayerState state) {
    if (state is PlayerLoadingState) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white),
              SizedBox(height: 16),
              Text(
                '載入影片中...',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    } else if (state is PlayerErrorState) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                '播放失敗',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                state.message,
                style: const TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _initializePlayer,
                child: const Text('重新載入'),
              ),
            ],
          ),
        ),
      );
    } else if (state is PlayerReadyState || 
               state is PlayerPlayingState || 
               state is PlayerPausedState ||
               state is PlayerEndedState) {
      // 獲取 VideoPlayerController
      VideoPlayerController? controller;
      
      if (state is PlayerReadyState) {
        controller = state.controller;
      } else if (state is PlayerPlayingState) {
        controller = state.controller;
      } else if (state is PlayerPausedState) {
        controller = state.controller;
      } else if (state is PlayerEndedState) {
        controller = state.controller;
      }
      
      if (controller != null && controller.value.isInitialized) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Center(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
        );
      }
    }
    
    // 預設狀態 - 顯示準備中
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.videoTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              '準備播放影片...',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  // ✨ 修正後的 _buildControlsOverlay 方法
  Widget _buildControlsOverlay(PlayerState state) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // 漸層背景
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.3, 0.7, 1.0], // 調整漸層範圍
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          // 頂部控制列
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildTopControls(),
          ),
          // 中間播放控制
          Center(
            child: _buildCenterControls(state),
          ),
          // 底部控制列
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomControls(state),
          ),
        ],
      ),
    );
  }

  Widget _buildTopControls() {
    return SafeArea(
      bottom: false, // 不影響底部
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
              onPressed: () => context.go('/'),
              tooltip: '返回',
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.videoTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white, size: 24),
              onPressed: () {
                // 顯示更多選項
              },
              tooltip: '更多選項',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterControls(PlayerState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.skip_previous, color: Colors.white),
            iconSize: 40,
            onPressed: () {
              // 上一集功能
            },
            tooltip: '上一集',
          ),
          const SizedBox(width: 32),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                state is PlayerPlayingState
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
                color: Colors.white,
              ),
              iconSize: 72,
              onPressed: () {
                if (state is PlayerPlayingState) {
                  context.read<PlayerBloc>().add(PlayerPauseEvent());
                } else {
                  context.read<PlayerBloc>().add(PlayerPlayEvent());
                }
              },
              tooltip: state is PlayerPlayingState ? '暫停' : '播放',
            ),
          ),
          const SizedBox(width: 32),
          IconButton(
            icon: const Icon(Icons.skip_next, color: Colors.white),
            iconSize: 40,
            onPressed: () {
              // 下一集功能
            },
            tooltip: '下一集',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls(PlayerState state) {
    return SafeArea(
      bottom: false, // 不讓 SafeArea 影響底部
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24), // 調整 padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch, // 讓子元素填滿寬度
          children: [
            // 進度條區域
            if (state is PlayerPlayingState || state is PlayerPausedState)
              _buildProgressBar(state),
            const SizedBox(height: 12), // 恢復適當間距
            // 底部按鈕列
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 平均分布按鈕
              children: [
                // 左側：播放速度或其他控制
                IconButton(
                  icon: const Icon(Icons.speed, color: Colors.white),
                  onPressed: () {
                    // 播放速度設定
                  },
                ),
                // 中間：主要控制按鈕
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.subtitles, color: Colors.white),
                      onPressed: () {
                        // 字幕設定
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                        // 播放設定
                      },
                    ),
                  ],
                ),
                // 右側：全螢幕按鈕
                IconButton(
                  icon: Icon(
                    _isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFullscreen = !_isFullscreen;
                    });
                    context.read<PlayerBloc>().add(PlayerFullscreenToggleEvent());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(PlayerState state) {
    double progress = 0.0;
    Duration position = Duration.zero;
    Duration duration = const Duration(minutes: 30);

    if (state is PlayerPlayingState) {
      position = state.position;
      duration = state.duration;
    } else if (state is PlayerPausedState) {
      position = state.position;
      duration = state.duration;
    }

    if (duration.inMilliseconds > 0) {
      progress = position.inMilliseconds / duration.inMilliseconds;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // 讓進度條填滿寬度
      children: [
        // 進度條
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red,
            inactiveTrackColor: Colors.white30,
            thumbColor: Colors.red,
            overlayColor: Colors.red.withOpacity(0.2),
            trackHeight: 3.0,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
          ),
          child: Slider(
            value: progress.clamp(0.0, 1.0),
            onChanged: (value) {
              final newPosition = Duration(
                milliseconds: (value * duration.inMilliseconds).round(),
              );
              context.read<PlayerBloc>().add(PlayerSeekEvent(newPosition));
            },
          ),
        ),
        const SizedBox(height: 4), // 進度條和時間之間的間距
        // 時間顯示
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(position),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                _formatDuration(duration),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    // ... (這個方法保持不變)
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '$hours:${twoDigits(minutes)}:${twoDigits(seconds)}';
    } else {
      return '${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
  }
}