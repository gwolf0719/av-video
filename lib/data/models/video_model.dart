import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/video_entity.dart';
import '../../domain/entities/video_detail_entity.dart';
import '../../domain/entities/subtitle_entity.dart';
import '../../core/enums/video_source.dart';
import '../../core/enums/video_quality.dart';
import '../../core/enums/subtitle_format.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    required String id,
    required String title,
    required String thumbnail,
    required String description,
    required int durationInSeconds,
    required List<String> tags,
    required VideoSource source,
    String? playUrl,
    DateTime? publishDate,
  }) = _VideoModel;
  
  factory VideoModel.fromJson(Map<String, dynamic> json) =>
    _$VideoModelFromJson(json);
}

@freezed
class VideoDetailModel with _$VideoDetailModel {
  const factory VideoDetailModel({
    required VideoModel video,
    required List<VideoQuality> availableQualities,
    required List<SubtitleModel> subtitles,
    required List<VideoModel> relatedVideos,
    required Map<String, String> playUrls,
    String? description,
    int? viewCount,
    double? rating,
  }) = _VideoDetailModel;
  
  factory VideoDetailModel.fromJson(Map<String, dynamic> json) =>
    _$VideoDetailModelFromJson(json);
}

@freezed
class SubtitleModel with _$SubtitleModel {
  const factory SubtitleModel({
    required String id,
    required String languageCode,
    required String languageName,
    required String url,
    required SubtitleFormat format,
    @Default(false) bool isDefault,
  }) = _SubtitleModel;
  
  factory SubtitleModel.fromJson(Map<String, dynamic> json) =>
    _$SubtitleModelFromJson(json);
}

// 資料轉換器 (Mappers)
extension VideoModelMapper on VideoModel {
  VideoEntity toEntity() {
    return VideoEntity(
      id: id,
      title: title,
      thumbnail: thumbnail,
      description: description,
      duration: Duration(seconds: durationInSeconds),
      tags: tags,
      source: source,
      playUrl: playUrl,
      publishDate: publishDate,
    );
  }
}

extension VideoEntityMapper on VideoEntity {
  VideoModel toModel() {
    return VideoModel(
      id: id,
      title: title,
      thumbnail: thumbnail,
      description: description,
      durationInSeconds: duration.inSeconds,
      tags: tags,
      source: source,
      playUrl: playUrl,
      publishDate: publishDate,
    );
  }
}

extension VideoDetailModelMapper on VideoDetailModel {
  VideoDetailEntity toEntity() {
    return VideoDetailEntity(
      video: video.toEntity(),
      availableQualities: availableQualities,
      subtitles: subtitles.map((s) => s.toEntity()).toList(),
      relatedVideos: relatedVideos.map((v) => v.toEntity()).toList(),
      playUrls: playUrls,
      description: description,
      viewCount: viewCount,
      rating: rating,
    );
  }
}

extension SubtitleModelMapper on SubtitleModel {
  SubtitleEntity toEntity() {
    return SubtitleEntity(
      id: id,
      languageCode: languageCode,
      languageName: languageName,
      url: url,
      format: format,
      isDefault: isDefault,
    );
  }
} 