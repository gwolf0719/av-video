import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/video_entity.dart'; // <--- 1. 匯入 VideoEntity

class VideoGridItem extends StatelessWidget {
  // 2. 將類型從 dynamic 改為 VideoEntity
  final VideoEntity video;
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
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 影片封面
            Expanded(
              flex: 4,
              child: _buildThumbnail(),
            ),
            // 影片資訊
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  video.title, // 3. 直接使用 video.title
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    // 4. 直接使用 video.thumbnail
    if (video.thumbnail.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: video.thumbnail,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[800],
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white70),
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
          color: Colors.white54,
        ),
      ),
    );
  }
}