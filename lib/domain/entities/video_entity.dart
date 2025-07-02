import 'package:equatable/equatable.dart';
import '../../core/enums/video_source.dart';

class VideoEntity extends Equatable {
  final String id;
  final String title;
  final String thumbnail;
  final String description;
  final Duration duration;
  final List<String> tags;
  final VideoSource source;
  final String? playUrl;
  final DateTime? publishDate;
  
  const VideoEntity({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.duration,
    required this.tags,
    required this.source,
    this.playUrl,
    this.publishDate,
  });
  
  // 業務邏輯方法
  bool get isLongVideo => duration.inMinutes > 60;
  bool get hasPlayUrl => playUrl != null && playUrl!.isNotEmpty;
  bool hasTag(String tag) => tags.contains(tag);
  
  String get formattedDuration {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '$minutes:${seconds.toString().padLeft(2, '0')}';
    }
  }
  
  VideoEntity copyWith({
    String? id,
    String? title,
    String? thumbnail,
    String? description,
    Duration? duration,
    List<String>? tags,
    VideoSource? source,
    String? playUrl,
    DateTime? publishDate,
  }) {
    return VideoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      tags: tags ?? this.tags,
      source: source ?? this.source,
      playUrl: playUrl ?? this.playUrl,
      publishDate: publishDate ?? this.publishDate,
    );
  }
  
  @override
  List<Object?> get props => [
    id,
    title,
    thumbnail,
    description,
    duration,
    tags,
    source,
    playUrl,
    publishDate,
  ];
} 