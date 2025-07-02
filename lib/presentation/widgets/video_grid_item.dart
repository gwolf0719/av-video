import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VideoGridItem extends StatelessWidget {
  final dynamic video;
  final VoidCallback onTap;

  const VideoGridItem({
    Key? key,
    required this.video,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 影片封面
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: _buildThumbnail(),
              ),
            ),
            // 影片資訊
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getVideoTitle(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getVideoInfo(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                            fontSize: 11,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    final thumbnailUrl = _getThumbnailUrl();
    
    if (thumbnailUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: thumbnailUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[300],
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        errorWidget: (context, url, error) => _buildDefaultThumbnail(),
      );
    } else {
      return _buildDefaultThumbnail();
    }
  }

  Widget _buildDefaultThumbnail() {
    return Container(
      color: Colors.grey[800],
      child: const Center(
        child: Icon(
          Icons.play_circle_outline,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  String _getVideoTitle() {
    if (video is Map<String, dynamic>) {
      return video['title'] ?? video['name'] ?? '未知標題';
    }
    return '示例影片';
  }

  String _getThumbnailUrl() {
    if (video is Map<String, dynamic>) {
      return video['thumbnail'] ?? video['image'] ?? video['poster'] ?? '';
    }
    return '';
  }

  String _getVideoInfo() {
    if (video is Map<String, dynamic>) {
      final duration = video['duration'] ?? '';
      final views = video['views'] ?? '';
      final date = video['date'] ?? '';
      
      List<String> info = [];
      if (duration.isNotEmpty) info.add(duration);
      if (views.isNotEmpty) info.add('${views}次觀看');
      if (date.isNotEmpty) info.add(date);
      
      return info.isNotEmpty ? info.join(' • ') : '影片資訊';
    }
    return '點擊播放';
  }
} 