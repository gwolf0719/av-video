import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../blocs/player/player_bloc.dart';

class PlayerPage extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;

  const PlayerPage({
    Key? key,
    required this.videoUrl,
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
    super.dispose();
  }

  void _initializePlayer() {
    context.read<PlayerBloc>().add(
          PlayerInitializeEvent(
            videoUrl: widget.videoUrl,
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
                children: [
                  // 影片播放區域
                  Center(
                    child: _buildVideoPlayer(state),
                  ),
                  // 控制介面
                  if (_isControlsVisible)
                    _buildControlsOverlay(state),
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
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.white),
          SizedBox(height: 16),
          Text(
            '初始化播放器...',
            style: TextStyle(color: Colors.white),
          ),
        ],
      );
    } else if (state is PlayerErrorState) {
      return Column(
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
      );
    } else {
      // 實際的影片播放器應該在這裡
      // 目前顯示佔位符
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              state is PlayerPlayingState
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_filled,
              color: Colors.white,
              size: 80,
            ),
            const SizedBox(height: 16),
            Text(
              widget.videoTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              '這裡將顯示實際的影片播放器',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildControlsOverlay(PlayerState state) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.7),
            Colors.transparent,
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // 頂部控制列
            _buildTopControls(),
            // 中間播放控制
            Expanded(
              child: _buildCenterControls(state),
            ),
            // 底部控制列
            _buildBottomControls(state),
          ],
        ),
      ),
    );
  }

  Widget _buildTopControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.go('/'),
          ),
          Expanded(
            child: Text(
              widget.videoTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // 顯示更多選項
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCenterControls(PlayerState state) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.skip_previous, color: Colors.white),
            iconSize: 48,
            onPressed: () {
              // 上一集功能
            },
          ),
          const SizedBox(width: 24),
          IconButton(
            icon: Icon(
              state is PlayerPlayingState
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_filled,
              color: Colors.white,
            ),
            iconSize: 64,
            onPressed: () {
              if (state is PlayerPlayingState) {
                context.read<PlayerBloc>().add(PlayerPauseEvent());
              } else {
                context.read<PlayerBloc>().add(PlayerPlayEvent());
              }
            },
          ),
          const SizedBox(width: 24),
          IconButton(
            icon: const Icon(Icons.skip_next, color: Colors.white),
            iconSize: 48,
            onPressed: () {
              // 下一集功能
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls(PlayerState state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 進度條
          if (state is PlayerPlayingState || state is PlayerPausedState)
            _buildProgressBar(state),
          const SizedBox(height: 16),
          // 底部按鈕
          Row(
            children: [
              Text(
                _formatDuration(Duration.zero),
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
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
      children: [
        Slider(
          value: progress.clamp(0.0, 1.0),
          onChanged: (value) {
            final newPosition = Duration(
              milliseconds: (value * duration.inMilliseconds).round(),
            );
            context.read<PlayerBloc>().add(PlayerSeekEvent(newPosition));
          },
          activeColor: Colors.red,
          inactiveColor: Colors.white30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatDuration(position),
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              _formatDuration(duration),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
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