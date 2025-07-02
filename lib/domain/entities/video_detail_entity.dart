import 'package:equatable/equatable.dart';
import 'video_entity.dart';
import 'subtitle_entity.dart';
import '../../core/enums/video_quality.dart';

class VideoDetailEntity extends Equatable {
  final VideoEntity video;
  final List<VideoQuality> availableQualities;
  final List<SubtitleEntity> subtitles;
  final List<VideoEntity> relatedVideos;
  final Map<String, String> playUrls; // quality -> url
  final String? description;
  final int? viewCount;
  final double? rating;
  
  const VideoDetailEntity({
    required this.video,
    required this.availableQualities,
    required this.subtitles,
    required this.relatedVideos,
    required this.playUrls,
    this.description,
    this.viewCount,
    this.rating,
  });
  
  String? getPlayUrlForQuality(VideoQuality quality) {
    return playUrls[quality.displayName];
  }
  
  VideoQuality get bestAvailableQuality {
    if (availableQualities.isEmpty) return VideoQuality.auto;
    
    // 優先選擇1080p，然後720p，最後是auto
    final preferredOrder = [
      VideoQuality.p1080,
      VideoQuality.p720,
      VideoQuality.p480,
      VideoQuality.auto,
    ];
    
    for (final quality in preferredOrder) {
      if (availableQualities.contains(quality)) {
        return quality;
      }
    }
    
    return availableQualities.first;
  }
  
  List<SubtitleEntity> getSubtitlesForLanguage(String languageCode) {
    return subtitles.where((sub) => sub.languageCode == languageCode).toList();
  }
  
  @override
  List<Object?> get props => [
    video,
    availableQualities,
    subtitles,
    relatedVideos,
    playUrls,
    description,
    viewCount,
    rating,
  ];
} 