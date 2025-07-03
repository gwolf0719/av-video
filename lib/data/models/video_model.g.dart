// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoModelImpl _$$VideoModelImplFromJson(Map<String, dynamic> json) =>
    _$VideoModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
      description: json['description'] as String,
      durationInSeconds: (json['durationInSeconds'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      source: $enumDecode(_$VideoSourceEnumMap, json['source']),
      playUrl: json['playUrl'] as String?,
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
    );

Map<String, dynamic> _$$VideoModelImplToJson(_$VideoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'durationInSeconds': instance.durationInSeconds,
      'tags': instance.tags,
      'source': _$VideoSourceEnumMap[instance.source]!,
      'playUrl': instance.playUrl,
      'publishDate': instance.publishDate?.toIso8601String(),
    };

const _$VideoSourceEnumMap = {
  VideoSource.anime: 'anime',
  VideoSource.limit1: 'limit1',
};

_$VideoDetailModelImpl _$$VideoDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VideoDetailModelImpl(
      video: VideoModel.fromJson(json['video'] as Map<String, dynamic>),
      availableQualities: (json['availableQualities'] as List<dynamic>)
          .map((e) => $enumDecode(_$VideoQualityEnumMap, e))
          .toList(),
      subtitles: (json['subtitles'] as List<dynamic>)
          .map((e) => SubtitleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedVideos: (json['relatedVideos'] as List<dynamic>)
          .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      playUrls: Map<String, String>.from(json['playUrls'] as Map),
      description: json['description'] as String?,
      viewCount: (json['viewCount'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$VideoDetailModelImplToJson(
        _$VideoDetailModelImpl instance) =>
    <String, dynamic>{
      'video': instance.video,
      'availableQualities': instance.availableQualities
          .map((e) => _$VideoQualityEnumMap[e]!)
          .toList(),
      'subtitles': instance.subtitles,
      'relatedVideos': instance.relatedVideos,
      'playUrls': instance.playUrls,
      'description': instance.description,
      'viewCount': instance.viewCount,
      'rating': instance.rating,
    };

const _$VideoQualityEnumMap = {
  VideoQuality.auto: 'auto',
  VideoQuality.p360: 'p360',
  VideoQuality.p480: 'p480',
  VideoQuality.p720: 'p720',
  VideoQuality.p1080: 'p1080',
  VideoQuality.p1440: 'p1440',
  VideoQuality.p2160: 'p2160',
};

_$SubtitleModelImpl _$$SubtitleModelImplFromJson(Map<String, dynamic> json) =>
    _$SubtitleModelImpl(
      id: json['id'] as String,
      languageCode: json['languageCode'] as String,
      languageName: json['languageName'] as String,
      url: json['url'] as String,
      format: $enumDecode(_$SubtitleFormatEnumMap, json['format']),
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$$SubtitleModelImplToJson(_$SubtitleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'languageCode': instance.languageCode,
      'languageName': instance.languageName,
      'url': instance.url,
      'format': _$SubtitleFormatEnumMap[instance.format]!,
      'isDefault': instance.isDefault,
    };

const _$SubtitleFormatEnumMap = {
  SubtitleFormat.srt: 'srt',
  SubtitleFormat.vtt: 'vtt',
  SubtitleFormat.ass: 'ass',
  SubtitleFormat.ssa: 'ssa',
  SubtitleFormat.sub: 'sub',
  SubtitleFormat.sbv: 'sbv',
};
