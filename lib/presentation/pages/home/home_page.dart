import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/enums/video_source.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/video_entity.dart';
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
                    print('videoState: $videoState');
                    // 1. 如果正在載入，顯示載入中
                    if (videoState is VideoLoading) {
                      return const LoadingWidget();
                    } 
                    // 2. 如果載入失敗，顯示錯誤訊息
                    else if (videoState is VideoError) {
                      return CustomErrorWidget(
                        message: videoState.message,
                        onRetry: _loadVideos,
                      );
                    }
                    // 3. 如果載入成功，顯示影片網格
                    else if (videoState is VideoLoaded) {
                      // 加一個判斷，如果影片列表是空的，就顯示提示
                      if (videoState.videos.isEmpty) {
                        return const Center(child: Text('此分類目前沒有影片。'));
                      }
                      // 如果有影片，就用 _buildVideoGrid 把它們畫出來
                      return RefreshIndicator(
                        onRefresh: () async => _loadVideos(),
                        child: _buildVideoGrid(videoState.videos),
                      );
                    } 
                    // 4. 如果載入成功，顯示影片網格
                    else {
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

  Widget _buildVideoGrid(List<VideoEntity> videos) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView.builder(
      // key: PageStorageKey<String>('video_grid_${_getCurrentSource(context.read<NavigationBloc>().state)}'),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, 
        childAspectRatio: 0.7,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: videos.length, // 這裡的長度就是您 Log 中看到的 24
      itemBuilder: (context, index) {
        final video = videos[index];
        return VideoGridItem(
          // 使用 VideoEntity 的屬性來傳遞資料
          video: video, // 確保 video 物件被正確傳遞
          onTap: () {
            context.go('/player', extra: {
              'videoUrl': video.playUrl ?? '', // 使用從 video 物件中獲取到的 URL
              'videoTitle': video.title,
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