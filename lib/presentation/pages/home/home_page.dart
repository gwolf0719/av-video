import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/enums/video_source.dart';
import '../../../core/theme/app_theme.dart';
import '../../blocs/video/video_bloc.dart';
import '../../blocs/navigation/navigation_bloc.dart';
import '../../widgets/video_grid_item.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/error_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadVideos();
  }

  void _loadVideos() {
    final navigationBloc = context.read<NavigationBloc>();
    final videoBloc = context.read<VideoBloc>();
    
    videoBloc.add(VideoEvent.loadVideos(
      navigationBloc.currentSource,
      1,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, navigationState) {
          if (_isLoading(navigationState)) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('切換資料源中...'),
                ],
              ),
            );
          }

          return Column(
            children: [
              // 頂部控制列 - 資料源切換和設定
              SafeArea(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.cardColor,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      // 資料源選擇
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: VideoSource.values
                                .map((source) => Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: ChoiceChip(
                                        label: Text(_getSourceName(source)),
                                        selected: _getCurrentSource(navigationState) == source,
                                        onSelected: (selected) {
                                          if (selected) {
                                            context.read<NavigationBloc>().add(
                                              VideoSourceChangedEvent(source),
                                            );
                                            _loadVideos();
                                          }
                                        },
                                        avatar: Icon(
                                          _getSourceIcon(source),
                                          size: 18,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      // 設定按鈕
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () => context.go('/settings'),
                        tooltip: '設定',
                      ),
                    ],
                  ),
                ),
              ),
              // 影片網格
              Expanded(
                child: BlocBuilder<VideoBloc, VideoState>(
                  builder: (context, videoState) {
                    if (videoState is VideoLoading) {
                      return const LoadingWidget();
                    } else if (videoState is VideoError) {
                      return CustomErrorWidget(
                        message: videoState.message,
                        onRetry: _loadVideos,
                      );
                    } else if (videoState is VideoLoaded) {
                      return RefreshIndicator(
                        onRefresh: () async => _loadVideos(),
                        child: _buildVideoGrid(videoState.videos),
                      );
                    } else {
                      return const Center(
                        child: Text('開始載入影片...'),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildVideoGrid(List<dynamic> videos) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: GridThemeData.crossAxisCount, // 一行5個
          childAspectRatio: GridThemeData.childAspectRatio,
          crossAxisSpacing: GridThemeData.spacing,
          mainAxisSpacing: GridThemeData.runSpacing,
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoGridItem(
            video: videos[index],
            onTap: () {
              context.go('/player', extra: {
                'videoUrl': 'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4',
                'videoTitle': '示例影片 ${index + 1}',
              });
            },
          );
        },
      ),
    );
  }

  VideoSource _getCurrentSource(NavigationState state) {
    if (state is NavigationUpdated) {
      return state.currentSource;
    } else if (state is NavigationInitial) {
      return state.currentSource;
    }
    return VideoSource.anime;
  }

  bool _isLoading(NavigationState state) {
    return state is NavigationUpdated && state.isLoading;
  }

  String _getSourceName(VideoSource source) {
    switch (source) {
      case VideoSource.anime:
        return '動畫頁籤';
      case VideoSource.limit1:
        return 'LIMIT1中文字幕';
      case VideoSource.chinese1:
        return '中文1中文字幕';
    }
  }

  IconData _getSourceIcon(VideoSource source) {
    switch (source) {
      case VideoSource.anime:
        return Icons.animation;
      case VideoSource.limit1:
        return Icons.subtitles;
      case VideoSource.chinese1:
        return Icons.closed_caption;
    }
  }
} 