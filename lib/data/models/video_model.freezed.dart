// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) {
  return _VideoModel.fromJson(json);
}

/// @nodoc
mixin _$VideoModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get durationInSeconds => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  VideoSource get source => throw _privateConstructorUsedError;
  String? get playUrl => throw _privateConstructorUsedError;
  DateTime? get publishDate => throw _privateConstructorUsedError;

  /// Serializes this VideoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoModelCopyWith<VideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoModelCopyWith<$Res> {
  factory $VideoModelCopyWith(
          VideoModel value, $Res Function(VideoModel) then) =
      _$VideoModelCopyWithImpl<$Res, VideoModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String thumbnail,
      String description,
      int durationInSeconds,
      List<String> tags,
      VideoSource source,
      String? playUrl,
      DateTime? publishDate});
}

/// @nodoc
class _$VideoModelCopyWithImpl<$Res, $Val extends VideoModel>
    implements $VideoModelCopyWith<$Res> {
  _$VideoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnail = null,
    Object? description = null,
    Object? durationInSeconds = null,
    Object? tags = null,
    Object? source = null,
    Object? playUrl = freezed,
    Object? publishDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      durationInSeconds: null == durationInSeconds
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as VideoSource,
      playUrl: freezed == playUrl
          ? _value.playUrl
          : playUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoModelImplCopyWith<$Res>
    implements $VideoModelCopyWith<$Res> {
  factory _$$VideoModelImplCopyWith(
          _$VideoModelImpl value, $Res Function(_$VideoModelImpl) then) =
      __$$VideoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String thumbnail,
      String description,
      int durationInSeconds,
      List<String> tags,
      VideoSource source,
      String? playUrl,
      DateTime? publishDate});
}

/// @nodoc
class __$$VideoModelImplCopyWithImpl<$Res>
    extends _$VideoModelCopyWithImpl<$Res, _$VideoModelImpl>
    implements _$$VideoModelImplCopyWith<$Res> {
  __$$VideoModelImplCopyWithImpl(
      _$VideoModelImpl _value, $Res Function(_$VideoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnail = null,
    Object? description = null,
    Object? durationInSeconds = null,
    Object? tags = null,
    Object? source = null,
    Object? playUrl = freezed,
    Object? publishDate = freezed,
  }) {
    return _then(_$VideoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      durationInSeconds: null == durationInSeconds
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as VideoSource,
      playUrl: freezed == playUrl
          ? _value.playUrl
          : playUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoModelImpl implements _VideoModel {
  const _$VideoModelImpl(
      {required this.id,
      required this.title,
      required this.thumbnail,
      required this.description,
      required this.durationInSeconds,
      required final List<String> tags,
      required this.source,
      this.playUrl,
      this.publishDate})
      : _tags = tags;

  factory _$VideoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String thumbnail;
  @override
  final String description;
  @override
  final int durationInSeconds;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final VideoSource source;
  @override
  final String? playUrl;
  @override
  final DateTime? publishDate;

  @override
  String toString() {
    return 'VideoModel(id: $id, title: $title, thumbnail: $thumbnail, description: $description, durationInSeconds: $durationInSeconds, tags: $tags, source: $source, playUrl: $playUrl, publishDate: $publishDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.durationInSeconds, durationInSeconds) ||
                other.durationInSeconds == durationInSeconds) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.playUrl, playUrl) || other.playUrl == playUrl) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      thumbnail,
      description,
      durationInSeconds,
      const DeepCollectionEquality().hash(_tags),
      source,
      playUrl,
      publishDate);

  /// Create a copy of VideoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoModelImplCopyWith<_$VideoModelImpl> get copyWith =>
      __$$VideoModelImplCopyWithImpl<_$VideoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoModelImplToJson(
      this,
    );
  }
}

abstract class _VideoModel implements VideoModel {
  const factory _VideoModel(
      {required final String id,
      required final String title,
      required final String thumbnail,
      required final String description,
      required final int durationInSeconds,
      required final List<String> tags,
      required final VideoSource source,
      final String? playUrl,
      final DateTime? publishDate}) = _$VideoModelImpl;

  factory _VideoModel.fromJson(Map<String, dynamic> json) =
      _$VideoModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get thumbnail;
  @override
  String get description;
  @override
  int get durationInSeconds;
  @override
  List<String> get tags;
  @override
  VideoSource get source;
  @override
  String? get playUrl;
  @override
  DateTime? get publishDate;

  /// Create a copy of VideoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoModelImplCopyWith<_$VideoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoDetailModel _$VideoDetailModelFromJson(Map<String, dynamic> json) {
  return _VideoDetailModel.fromJson(json);
}

/// @nodoc
mixin _$VideoDetailModel {
  VideoModel get video => throw _privateConstructorUsedError;
  List<VideoQuality> get availableQualities =>
      throw _privateConstructorUsedError;
  List<SubtitleModel> get subtitles => throw _privateConstructorUsedError;
  List<VideoModel> get relatedVideos => throw _privateConstructorUsedError;
  Map<String, String> get playUrls => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;

  /// Serializes this VideoDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoDetailModelCopyWith<VideoDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoDetailModelCopyWith<$Res> {
  factory $VideoDetailModelCopyWith(
          VideoDetailModel value, $Res Function(VideoDetailModel) then) =
      _$VideoDetailModelCopyWithImpl<$Res, VideoDetailModel>;
  @useResult
  $Res call(
      {VideoModel video,
      List<VideoQuality> availableQualities,
      List<SubtitleModel> subtitles,
      List<VideoModel> relatedVideos,
      Map<String, String> playUrls,
      String? description,
      int? viewCount,
      double? rating});

  $VideoModelCopyWith<$Res> get video;
}

/// @nodoc
class _$VideoDetailModelCopyWithImpl<$Res, $Val extends VideoDetailModel>
    implements $VideoDetailModelCopyWith<$Res> {
  _$VideoDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = null,
    Object? availableQualities = null,
    Object? subtitles = null,
    Object? relatedVideos = null,
    Object? playUrls = null,
    Object? description = freezed,
    Object? viewCount = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as VideoModel,
      availableQualities: null == availableQualities
          ? _value.availableQualities
          : availableQualities // ignore: cast_nullable_to_non_nullable
              as List<VideoQuality>,
      subtitles: null == subtitles
          ? _value.subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<SubtitleModel>,
      relatedVideos: null == relatedVideos
          ? _value.relatedVideos
          : relatedVideos // ignore: cast_nullable_to_non_nullable
              as List<VideoModel>,
      playUrls: null == playUrls
          ? _value.playUrls
          : playUrls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of VideoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoModelCopyWith<$Res> get video {
    return $VideoModelCopyWith<$Res>(_value.video, (value) {
      return _then(_value.copyWith(video: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VideoDetailModelImplCopyWith<$Res>
    implements $VideoDetailModelCopyWith<$Res> {
  factory _$$VideoDetailModelImplCopyWith(_$VideoDetailModelImpl value,
          $Res Function(_$VideoDetailModelImpl) then) =
      __$$VideoDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VideoModel video,
      List<VideoQuality> availableQualities,
      List<SubtitleModel> subtitles,
      List<VideoModel> relatedVideos,
      Map<String, String> playUrls,
      String? description,
      int? viewCount,
      double? rating});

  @override
  $VideoModelCopyWith<$Res> get video;
}

/// @nodoc
class __$$VideoDetailModelImplCopyWithImpl<$Res>
    extends _$VideoDetailModelCopyWithImpl<$Res, _$VideoDetailModelImpl>
    implements _$$VideoDetailModelImplCopyWith<$Res> {
  __$$VideoDetailModelImplCopyWithImpl(_$VideoDetailModelImpl _value,
      $Res Function(_$VideoDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = null,
    Object? availableQualities = null,
    Object? subtitles = null,
    Object? relatedVideos = null,
    Object? playUrls = null,
    Object? description = freezed,
    Object? viewCount = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$VideoDetailModelImpl(
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as VideoModel,
      availableQualities: null == availableQualities
          ? _value._availableQualities
          : availableQualities // ignore: cast_nullable_to_non_nullable
              as List<VideoQuality>,
      subtitles: null == subtitles
          ? _value._subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<SubtitleModel>,
      relatedVideos: null == relatedVideos
          ? _value._relatedVideos
          : relatedVideos // ignore: cast_nullable_to_non_nullable
              as List<VideoModel>,
      playUrls: null == playUrls
          ? _value._playUrls
          : playUrls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoDetailModelImpl implements _VideoDetailModel {
  const _$VideoDetailModelImpl(
      {required this.video,
      required final List<VideoQuality> availableQualities,
      required final List<SubtitleModel> subtitles,
      required final List<VideoModel> relatedVideos,
      required final Map<String, String> playUrls,
      this.description,
      this.viewCount,
      this.rating})
      : _availableQualities = availableQualities,
        _subtitles = subtitles,
        _relatedVideos = relatedVideos,
        _playUrls = playUrls;

  factory _$VideoDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoDetailModelImplFromJson(json);

  @override
  final VideoModel video;
  final List<VideoQuality> _availableQualities;
  @override
  List<VideoQuality> get availableQualities {
    if (_availableQualities is EqualUnmodifiableListView)
      return _availableQualities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableQualities);
  }

  final List<SubtitleModel> _subtitles;
  @override
  List<SubtitleModel> get subtitles {
    if (_subtitles is EqualUnmodifiableListView) return _subtitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtitles);
  }

  final List<VideoModel> _relatedVideos;
  @override
  List<VideoModel> get relatedVideos {
    if (_relatedVideos is EqualUnmodifiableListView) return _relatedVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedVideos);
  }

  final Map<String, String> _playUrls;
  @override
  Map<String, String> get playUrls {
    if (_playUrls is EqualUnmodifiableMapView) return _playUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_playUrls);
  }

  @override
  final String? description;
  @override
  final int? viewCount;
  @override
  final double? rating;

  @override
  String toString() {
    return 'VideoDetailModel(video: $video, availableQualities: $availableQualities, subtitles: $subtitles, relatedVideos: $relatedVideos, playUrls: $playUrls, description: $description, viewCount: $viewCount, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoDetailModelImpl &&
            (identical(other.video, video) || other.video == video) &&
            const DeepCollectionEquality()
                .equals(other._availableQualities, _availableQualities) &&
            const DeepCollectionEquality()
                .equals(other._subtitles, _subtitles) &&
            const DeepCollectionEquality()
                .equals(other._relatedVideos, _relatedVideos) &&
            const DeepCollectionEquality().equals(other._playUrls, _playUrls) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      video,
      const DeepCollectionEquality().hash(_availableQualities),
      const DeepCollectionEquality().hash(_subtitles),
      const DeepCollectionEquality().hash(_relatedVideos),
      const DeepCollectionEquality().hash(_playUrls),
      description,
      viewCount,
      rating);

  /// Create a copy of VideoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoDetailModelImplCopyWith<_$VideoDetailModelImpl> get copyWith =>
      __$$VideoDetailModelImplCopyWithImpl<_$VideoDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoDetailModelImplToJson(
      this,
    );
  }
}

abstract class _VideoDetailModel implements VideoDetailModel {
  const factory _VideoDetailModel(
      {required final VideoModel video,
      required final List<VideoQuality> availableQualities,
      required final List<SubtitleModel> subtitles,
      required final List<VideoModel> relatedVideos,
      required final Map<String, String> playUrls,
      final String? description,
      final int? viewCount,
      final double? rating}) = _$VideoDetailModelImpl;

  factory _VideoDetailModel.fromJson(Map<String, dynamic> json) =
      _$VideoDetailModelImpl.fromJson;

  @override
  VideoModel get video;
  @override
  List<VideoQuality> get availableQualities;
  @override
  List<SubtitleModel> get subtitles;
  @override
  List<VideoModel> get relatedVideos;
  @override
  Map<String, String> get playUrls;
  @override
  String? get description;
  @override
  int? get viewCount;
  @override
  double? get rating;

  /// Create a copy of VideoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoDetailModelImplCopyWith<_$VideoDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubtitleModel _$SubtitleModelFromJson(Map<String, dynamic> json) {
  return _SubtitleModel.fromJson(json);
}

/// @nodoc
mixin _$SubtitleModel {
  String get id => throw _privateConstructorUsedError;
  String get languageCode => throw _privateConstructorUsedError;
  String get languageName => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  SubtitleFormat get format => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this SubtitleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubtitleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtitleModelCopyWith<SubtitleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtitleModelCopyWith<$Res> {
  factory $SubtitleModelCopyWith(
          SubtitleModel value, $Res Function(SubtitleModel) then) =
      _$SubtitleModelCopyWithImpl<$Res, SubtitleModel>;
  @useResult
  $Res call(
      {String id,
      String languageCode,
      String languageName,
      String url,
      SubtitleFormat format,
      bool isDefault});
}

/// @nodoc
class _$SubtitleModelCopyWithImpl<$Res, $Val extends SubtitleModel>
    implements $SubtitleModelCopyWith<$Res> {
  _$SubtitleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubtitleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? languageCode = null,
    Object? languageName = null,
    Object? url = null,
    Object? format = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      languageName: null == languageName
          ? _value.languageName
          : languageName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as SubtitleFormat,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubtitleModelImplCopyWith<$Res>
    implements $SubtitleModelCopyWith<$Res> {
  factory _$$SubtitleModelImplCopyWith(
          _$SubtitleModelImpl value, $Res Function(_$SubtitleModelImpl) then) =
      __$$SubtitleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String languageCode,
      String languageName,
      String url,
      SubtitleFormat format,
      bool isDefault});
}

/// @nodoc
class __$$SubtitleModelImplCopyWithImpl<$Res>
    extends _$SubtitleModelCopyWithImpl<$Res, _$SubtitleModelImpl>
    implements _$$SubtitleModelImplCopyWith<$Res> {
  __$$SubtitleModelImplCopyWithImpl(
      _$SubtitleModelImpl _value, $Res Function(_$SubtitleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubtitleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? languageCode = null,
    Object? languageName = null,
    Object? url = null,
    Object? format = null,
    Object? isDefault = null,
  }) {
    return _then(_$SubtitleModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      languageName: null == languageName
          ? _value.languageName
          : languageName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as SubtitleFormat,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtitleModelImpl implements _SubtitleModel {
  const _$SubtitleModelImpl(
      {required this.id,
      required this.languageCode,
      required this.languageName,
      required this.url,
      required this.format,
      this.isDefault = false});

  factory _$SubtitleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtitleModelImplFromJson(json);

  @override
  final String id;
  @override
  final String languageCode;
  @override
  final String languageName;
  @override
  final String url;
  @override
  final SubtitleFormat format;
  @override
  @JsonKey()
  final bool isDefault;

  @override
  String toString() {
    return 'SubtitleModel(id: $id, languageCode: $languageCode, languageName: $languageName, url: $url, format: $format, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtitleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.languageName, languageName) ||
                other.languageName == languageName) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, languageCode, languageName, url, format, isDefault);

  /// Create a copy of SubtitleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtitleModelImplCopyWith<_$SubtitleModelImpl> get copyWith =>
      __$$SubtitleModelImplCopyWithImpl<_$SubtitleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtitleModelImplToJson(
      this,
    );
  }
}

abstract class _SubtitleModel implements SubtitleModel {
  const factory _SubtitleModel(
      {required final String id,
      required final String languageCode,
      required final String languageName,
      required final String url,
      required final SubtitleFormat format,
      final bool isDefault}) = _$SubtitleModelImpl;

  factory _SubtitleModel.fromJson(Map<String, dynamic> json) =
      _$SubtitleModelImpl.fromJson;

  @override
  String get id;
  @override
  String get languageCode;
  @override
  String get languageName;
  @override
  String get url;
  @override
  SubtitleFormat get format;
  @override
  bool get isDefault;

  /// Create a copy of SubtitleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtitleModelImplCopyWith<_$SubtitleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
