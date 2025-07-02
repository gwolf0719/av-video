// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoEvent {
  VideoSource get source => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VideoSource source, int page) loadVideos,
    required TResult Function(VideoSource source) refreshVideos,
    required TResult Function(VideoSource source, int page) loadMoreVideos,
    required TResult Function(String query, VideoSource source) searchVideos,
    required TResult Function(VideoSource source) changeSource,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VideoSource source, int page)? loadVideos,
    TResult? Function(VideoSource source)? refreshVideos,
    TResult? Function(VideoSource source, int page)? loadMoreVideos,
    TResult? Function(String query, VideoSource source)? searchVideos,
    TResult? Function(VideoSource source)? changeSource,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VideoSource source, int page)? loadVideos,
    TResult Function(VideoSource source)? refreshVideos,
    TResult Function(VideoSource source, int page)? loadMoreVideos,
    TResult Function(String query, VideoSource source)? searchVideos,
    TResult Function(VideoSource source)? changeSource,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadVideos value) loadVideos,
    required TResult Function(RefreshVideos value) refreshVideos,
    required TResult Function(LoadMoreVideos value) loadMoreVideos,
    required TResult Function(SearchVideos value) searchVideos,
    required TResult Function(ChangeSource value) changeSource,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadVideos value)? loadVideos,
    TResult? Function(RefreshVideos value)? refreshVideos,
    TResult? Function(LoadMoreVideos value)? loadMoreVideos,
    TResult? Function(SearchVideos value)? searchVideos,
    TResult? Function(ChangeSource value)? changeSource,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadVideos value)? loadVideos,
    TResult Function(RefreshVideos value)? refreshVideos,
    TResult Function(LoadMoreVideos value)? loadMoreVideos,
    TResult Function(SearchVideos value)? searchVideos,
    TResult Function(ChangeSource value)? changeSource,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoEventCopyWith<VideoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoEventCopyWith<$Res> {
  factory $VideoEventCopyWith(
          VideoEvent value, $Res Function(VideoEvent) then) =
      _$VideoEventCopyWithImpl<$Res, VideoEvent>;
  @useResult
  $Res call({VideoSource source});
}

/// @nodoc
class _$VideoEventCopyWithImpl<$Res, $Val extends VideoEvent>
    implements $VideoEventCopyWith<$Res> {
  _$VideoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as VideoSource,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadVideosImplCopyWith<$Res>
    implements $VideoEventCopyWith<$Res> {
  factory _$$LoadVideosImplCopyWith(
          _$LoadVideosImpl value, $Res Function(_$LoadVideosImpl) then) =
      __$$LoadVideosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VideoSource source, int page});
}

/// @nodoc
class __$$LoadVideosImplCopyWithImpl<$Res>
    extends _$VideoEventCopyWithImpl<$Res, _$LoadVideosImpl>
    implements _$$LoadVideosImplCopyWith<$Res> {
  __$$LoadVideosImplCopyWithImpl(
      _$LoadVideosImpl _value, $Res Function(_$LoadVideosImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? page = null,
  }) {
    return _then(_$LoadVideosImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as VideoSource,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadVideosImpl implements LoadVideos {
  const _$LoadVideosImpl(this.source, this.page);

  @override
  final VideoSource source;
  @override
  final int page;

  @override
  String toString() {
    return 'VideoEvent.loadVideos(source: $source, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadVideosImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, page);

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadVideosImplCopyWith<_$LoadVideosImpl> get copyWith =>
      __$$LoadVideosImplCopyWithImpl<_$LoadVideosImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VideoSource source, int page) loadVideos,
    required TResult Function(VideoSource source) refreshVideos,
    required TResult Function(VideoSource source, int page) loadMoreVideos,
    required TResult Function(String query, VideoSource source) searchVideos,
    required TResult Function(VideoSource source) changeSource,
  }) {
    return loadVideos(source, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VideoSource source, int page)? loadVideos,
    TResult? Function(VideoSource source)? refreshVideos,
    TResult? Function(VideoSource source, int page)? loadMoreVideos,
    TResult? Function(String query, VideoSource source)? searchVideos,
    TResult? Function(VideoSource source)? changeSource,
  }) {
    return loadVideos?.call(source, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VideoSource source, int page)? loadVideos,
    TResult Function(VideoSource source)? refreshVideos,
    TResult Function(VideoSource source, int page)? loadMoreVideos,
    TResult Function(String query, VideoSource source)? searchVideos,
    TResult Function(VideoSource source)? changeSource,
    required TResult orElse(),
  }) {
    if (loadVideos != null) {
      return loadVideos(source, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadVideos value) loadVideos,
    required TResult Function(RefreshVideos value) refreshVideos,
    required TResult Function(LoadMoreVideos value) loadMoreVideos,
    required TResult Function(SearchVideos value) searchVideos,
    required TResult Function(ChangeSource value) changeSource,
  }) {
    return loadVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadVideos value)? loadVideos,
    TResult? Function(RefreshVideos value)? refreshVideos,
    TResult? Function(LoadMoreVideos value)? loadMoreVideos,
    TResult? Function(SearchVideos value)? searchVideos,
    TResult? Function(ChangeSource value)? changeSource,
  }) {
    return loadVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadVideos value)? loadVideos,
    TResult Function(RefreshVideos value)? refreshVideos,
    TResult Function(LoadMoreVideos value)? loadMoreVideos,
    TResult Function(SearchVideos value)? searchVideos,
    TResult Function(ChangeSource value)? changeSource,
    required TResult orElse(),
  }) {
    if (loadVideos != null) {
      return loadVideos(this);
    }
    return orElse();
  }
}

abstract class LoadVideos implements VideoEvent {
  const factory LoadVideos(final VideoSource source, final int page) =
      _$LoadVideosImpl;

  @override
  VideoSource get source;
  int get page;

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadVideosImplCopyWith<_$LoadVideosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshVideosImplCopyWith<$Res>
    implements $VideoEventCopyWith<$Res> {
  factory _$$RefreshVideosImplCopyWith(
          _$RefreshVideosImpl value, $Res Function(_$RefreshVideosImpl) then) =
      __$$RefreshVideosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VideoSource source});
}

/// @nodoc
class __$$RefreshVideosImplCopyWithImpl<$Res>
    extends _$VideoEventCopyWithImpl<$Res, _$RefreshVideosImpl>
    implements _$$RefreshVideosImplCopyWith<$Res> {
  __$$RefreshVideosImplCopyWithImpl(
      _$RefreshVideosImpl _value, $Res Function(_$RefreshVideosImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$RefreshVideosImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as VideoSource,
    ));
  }
}

/// @nodoc

class _$RefreshVideosImpl implements RefreshVideos {
  const _$RefreshVideosImpl(this.source);

  @override
  final VideoSource source;

  @override
  String toString() {
    return 'VideoEvent.refreshVideos(source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshVideosImpl &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshVideosImplCopyWith<_$RefreshVideosImpl> get copyWith =>
      __$$RefreshVideosImplCopyWithImpl<_$RefreshVideosImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VideoSource source, int page) loadVideos,
    required TResult Function(VideoSource source) refreshVideos,
    required TResult Function(VideoSource source, int page) loadMoreVideos,
    required TResult Function(String query, VideoSource source) searchVideos,
    required TResult Function(VideoSource source) changeSource,
  }) {
    return refreshVideos(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VideoSource source, int page)? loadVideos,
    TResult? Function(VideoSource source)? refreshVideos,
    TResult? Function(VideoSource source, int page)? loadMoreVideos,
    TResult? Function(String query, VideoSource source)? searchVideos,
    TResult? Function(VideoSource source)? changeSource,
  }) {
    return refreshVideos?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VideoSource source, int page)? loadVideos,
    TResult Function(VideoSource source)? refreshVideos,
    TResult Function(VideoSource source, int page)? loadMoreVideos,
    TResult Function(String query, VideoSource source)? searchVideos,
    TResult Function(VideoSource source)? changeSource,
    required TResult orElse(),
  }) {
    if (refreshVideos != null) {
      return refreshVideos(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadVideos value) loadVideos,
    required TResult Function(RefreshVideos value) refreshVideos,
    required TResult Function(LoadMoreVideos value) loadMoreVideos,
    required TResult Function(SearchVideos value) searchVideos,
    required TResult Function(ChangeSource value) changeSource,
  }) {
    return refreshVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadVideos value)? loadVideos,
    TResult? Function(RefreshVideos value)? refreshVideos,
    TResult? Function(LoadMoreVideos value)? loadMoreVideos,
    TResult? Function(SearchVideos value)? searchVideos,
    TResult? Function(ChangeSource value)? changeSource,
  }) {
    return refreshVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadVideos value)? loadVideos,
    TResult Function(RefreshVideos value)? refreshVideos,
    TResult Function(LoadMoreVideos value)? loadMoreVideos,
    TResult Function(SearchVideos value)? searchVideos,
    TResult Function(ChangeSource value)? changeSource,
    required TResult orElse(),
  }) {
    if (refreshVideos != null) {
      return refreshVideos(this);
    }
    return orElse();
  }
}

abstract class RefreshVideos implements VideoEvent {
  const factory RefreshVideos(final VideoSource source) = _$RefreshVideosImpl;

  @override
  VideoSource get source;

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshVideosImplCopyWith<_$RefreshVideosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreVideosImplCopyWith<$Res>
    implements $VideoEventCopyWith<$Res> {
  factory _$$LoadMoreVideosImplCopyWith(_$LoadMoreVideosImpl value,
          $Res Function(_$LoadMoreVideosImpl) then) =
      __$$LoadMoreVideosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VideoSource source, int page});
}

/// @nodoc
class __$$LoadMoreVideosImplCopyWithImpl<$Res>
    extends _$VideoEventCopyWithImpl<$Res, _$LoadMoreVideosImpl>
    implements _$$LoadMoreVideosImplCopyWith<$Res> {
  __$$LoadMoreVideosImplCopyWithImpl(
      _$LoadMoreVideosImpl _value, $Res Function(_$LoadMoreVideosImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? page = null,
  }) {
    return _then(_$LoadMoreVideosImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as VideoSource,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadMoreVideosImpl implements LoadMoreVideos {
  const _$LoadMoreVideosImpl(this.source, this.page);

  @override
  final VideoSource source;
  @override
  final int page;

  @override
  String toString() {
    return 'VideoEvent.loadMoreVideos(source: $source, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreVideosImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, page);

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreVideosImplCopyWith<_$LoadMoreVideosImpl> get copyWith =>
      __$$LoadMoreVideosImplCopyWithImpl<_$LoadMoreVideosImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VideoSource source, int page) loadVideos,
    required TResult Function(VideoSource source) refreshVideos,
    required TResult Function(VideoSource source, int page) loadMoreVideos,
    required TResult Function(String query, VideoSource source) searchVideos,
    required TResult Function(VideoSource source) changeSource,
  }) {
    return loadMoreVideos(source, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VideoSource source, int page)? loadVideos,
    TResult? Function(VideoSource source)? refreshVideos,
    TResult? Function(VideoSource source, int page)? loadMoreVideos,
    TResult? Function(String query, VideoSource source)? searchVideos,
    TResult? Function(VideoSource source)? changeSource,
  }) {
    return loadMoreVideos?.call(source, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VideoSource source, int page)? loadVideos,
    TResult Function(VideoSource source)? refreshVideos,
    TResult Function(VideoSource source, int page)? loadMoreVideos,
    TResult Function(String query, VideoSource source)? searchVideos,
    TResult Function(VideoSource source)? changeSource,
    required TResult orElse(),
  }) {
    if (loadMoreVideos != null) {
      return loadMoreVideos(source, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadVideos value) loadVideos,
    required TResult Function(RefreshVideos value) refreshVideos,
    required TResult Function(LoadMoreVideos value) loadMoreVideos,
    required TResult Function(SearchVideos value) searchVideos,
    required TResult Function(ChangeSource value) changeSource,
  }) {
    return loadMoreVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadVideos value)? loadVideos,
    TResult? Function(RefreshVideos value)? refreshVideos,
    TResult? Function(LoadMoreVideos value)? loadMoreVideos,
    TResult? Function(SearchVideos value)? searchVideos,
    TResult? Function(ChangeSource value)? changeSource,
  }) {
    return loadMoreVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadVideos value)? loadVideos,
    TResult Function(RefreshVideos value)? refreshVideos,
    TResult Function(LoadMoreVideos value)? loadMoreVideos,
    TResult Function(SearchVideos value)? searchVideos,
    TResult Function(ChangeSource value)? changeSource,
    required TResult orElse(),
  }) {
    if (loadMoreVideos != null) {
      return loadMoreVideos(this);
    }
    return orElse();
  }
}

abstract class LoadMoreVideos implements VideoEvent {
  const factory LoadMoreVideos(final VideoSource source, final int page) =
      _$LoadMoreVideosImpl;

  @override
  VideoSource get source;
  int get page;

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMoreVideosImplCopyWith<_$LoadMoreVideosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchVideosImplCopyWith<$Res>
    implements $VideoEventCopyWith<$Res> {
  factory _$$SearchVideosImplCopyWith(
          _$SearchVideosImpl value, $Res Function(_$SearchVideosImpl) then) =
      __$$SearchVideosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, VideoSource source});
}

/// @nodoc
class __$$SearchVideosImplCopyWithImpl<$Res>
    extends _$VideoEventCopyWithImpl<$Res, _$SearchVideosImpl>
    implements _$$SearchVideosImplCopyWith<$Res> {
  __$$SearchVideosImplCopyWithImpl(
      _$SearchVideosImpl _value, $Res Function(_$SearchVideosImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? source = null,
  }) {
    return _then(_$SearchVideosImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as VideoSource,
    ));
  }
}

/// @nodoc

class _$SearchVideosImpl implements SearchVideos {
  const _$SearchVideosImpl(this.query, this.source);

  @override
  final String query;
  @override
  final VideoSource source;

  @override
  String toString() {
    return 'VideoEvent.searchVideos(query: $query, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchVideosImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, source);

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchVideosImplCopyWith<_$SearchVideosImpl> get copyWith =>
      __$$SearchVideosImplCopyWithImpl<_$SearchVideosImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VideoSource source, int page) loadVideos,
    required TResult Function(VideoSource source) refreshVideos,
    required TResult Function(VideoSource source, int page) loadMoreVideos,
    required TResult Function(String query, VideoSource source) searchVideos,
    required TResult Function(VideoSource source) changeSource,
  }) {
    return searchVideos(query, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VideoSource source, int page)? loadVideos,
    TResult? Function(VideoSource source)? refreshVideos,
    TResult? Function(VideoSource source, int page)? loadMoreVideos,
    TResult? Function(String query, VideoSource source)? searchVideos,
    TResult? Function(VideoSource source)? changeSource,
  }) {
    return searchVideos?.call(query, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VideoSource source, int page)? loadVideos,
    TResult Function(VideoSource source)? refreshVideos,
    TResult Function(VideoSource source, int page)? loadMoreVideos,
    TResult Function(String query, VideoSource source)? searchVideos,
    TResult Function(VideoSource source)? changeSource,
    required TResult orElse(),
  }) {
    if (searchVideos != null) {
      return searchVideos(query, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadVideos value) loadVideos,
    required TResult Function(RefreshVideos value) refreshVideos,
    required TResult Function(LoadMoreVideos value) loadMoreVideos,
    required TResult Function(SearchVideos value) searchVideos,
    required TResult Function(ChangeSource value) changeSource,
  }) {
    return searchVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadVideos value)? loadVideos,
    TResult? Function(RefreshVideos value)? refreshVideos,
    TResult? Function(LoadMoreVideos value)? loadMoreVideos,
    TResult? Function(SearchVideos value)? searchVideos,
    TResult? Function(ChangeSource value)? changeSource,
  }) {
    return searchVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadVideos value)? loadVideos,
    TResult Function(RefreshVideos value)? refreshVideos,
    TResult Function(LoadMoreVideos value)? loadMoreVideos,
    TResult Function(SearchVideos value)? searchVideos,
    TResult Function(ChangeSource value)? changeSource,
    required TResult orElse(),
  }) {
    if (searchVideos != null) {
      return searchVideos(this);
    }
    return orElse();
  }
}

abstract class SearchVideos implements VideoEvent {
  const factory SearchVideos(final String query, final VideoSource source) =
      _$SearchVideosImpl;

  String get query;
  @override
  VideoSource get source;

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchVideosImplCopyWith<_$SearchVideosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeSourceImplCopyWith<$Res>
    implements $VideoEventCopyWith<$Res> {
  factory _$$ChangeSourceImplCopyWith(
          _$ChangeSourceImpl value, $Res Function(_$ChangeSourceImpl) then) =
      __$$ChangeSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VideoSource source});
}

/// @nodoc
class __$$ChangeSourceImplCopyWithImpl<$Res>
    extends _$VideoEventCopyWithImpl<$Res, _$ChangeSourceImpl>
    implements _$$ChangeSourceImplCopyWith<$Res> {
  __$$ChangeSourceImplCopyWithImpl(
      _$ChangeSourceImpl _value, $Res Function(_$ChangeSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$ChangeSourceImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as VideoSource,
    ));
  }
}

/// @nodoc

class _$ChangeSourceImpl implements ChangeSource {
  const _$ChangeSourceImpl(this.source);

  @override
  final VideoSource source;

  @override
  String toString() {
    return 'VideoEvent.changeSource(source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeSourceImpl &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeSourceImplCopyWith<_$ChangeSourceImpl> get copyWith =>
      __$$ChangeSourceImplCopyWithImpl<_$ChangeSourceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VideoSource source, int page) loadVideos,
    required TResult Function(VideoSource source) refreshVideos,
    required TResult Function(VideoSource source, int page) loadMoreVideos,
    required TResult Function(String query, VideoSource source) searchVideos,
    required TResult Function(VideoSource source) changeSource,
  }) {
    return changeSource(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VideoSource source, int page)? loadVideos,
    TResult? Function(VideoSource source)? refreshVideos,
    TResult? Function(VideoSource source, int page)? loadMoreVideos,
    TResult? Function(String query, VideoSource source)? searchVideos,
    TResult? Function(VideoSource source)? changeSource,
  }) {
    return changeSource?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VideoSource source, int page)? loadVideos,
    TResult Function(VideoSource source)? refreshVideos,
    TResult Function(VideoSource source, int page)? loadMoreVideos,
    TResult Function(String query, VideoSource source)? searchVideos,
    TResult Function(VideoSource source)? changeSource,
    required TResult orElse(),
  }) {
    if (changeSource != null) {
      return changeSource(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadVideos value) loadVideos,
    required TResult Function(RefreshVideos value) refreshVideos,
    required TResult Function(LoadMoreVideos value) loadMoreVideos,
    required TResult Function(SearchVideos value) searchVideos,
    required TResult Function(ChangeSource value) changeSource,
  }) {
    return changeSource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadVideos value)? loadVideos,
    TResult? Function(RefreshVideos value)? refreshVideos,
    TResult? Function(LoadMoreVideos value)? loadMoreVideos,
    TResult? Function(SearchVideos value)? searchVideos,
    TResult? Function(ChangeSource value)? changeSource,
  }) {
    return changeSource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadVideos value)? loadVideos,
    TResult Function(RefreshVideos value)? refreshVideos,
    TResult Function(LoadMoreVideos value)? loadMoreVideos,
    TResult Function(SearchVideos value)? searchVideos,
    TResult Function(ChangeSource value)? changeSource,
    required TResult orElse(),
  }) {
    if (changeSource != null) {
      return changeSource(this);
    }
    return orElse();
  }
}

abstract class ChangeSource implements VideoEvent {
  const factory ChangeSource(final VideoSource source) = _$ChangeSourceImpl;

  @override
  VideoSource get source;

  /// Create a copy of VideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeSourceImplCopyWith<_$ChangeSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VideoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoading value) loading,
    required TResult Function(VideoLoaded value) loaded,
    required TResult Function(VideoError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoading value)? loading,
    TResult? Function(VideoLoaded value)? loaded,
    TResult? Function(VideoError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoading value)? loading,
    TResult Function(VideoLoaded value)? loaded,
    TResult Function(VideoError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoStateCopyWith<$Res> {
  factory $VideoStateCopyWith(
          VideoState value, $Res Function(VideoState) then) =
      _$VideoStateCopyWithImpl<$Res, VideoState>;
}

/// @nodoc
class _$VideoStateCopyWithImpl<$Res, $Val extends VideoState>
    implements $VideoStateCopyWith<$Res> {
  _$VideoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$VideoInitialImplCopyWith<$Res> {
  factory _$$VideoInitialImplCopyWith(
          _$VideoInitialImpl value, $Res Function(_$VideoInitialImpl) then) =
      __$$VideoInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VideoInitialImplCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res, _$VideoInitialImpl>
    implements _$$VideoInitialImplCopyWith<$Res> {
  __$$VideoInitialImplCopyWithImpl(
      _$VideoInitialImpl _value, $Res Function(_$VideoInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VideoInitialImpl implements VideoInitial {
  const _$VideoInitialImpl();

  @override
  String toString() {
    return 'VideoState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VideoInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoading value) loading,
    required TResult Function(VideoLoaded value) loaded,
    required TResult Function(VideoError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoading value)? loading,
    TResult? Function(VideoLoaded value)? loaded,
    TResult? Function(VideoError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoading value)? loading,
    TResult Function(VideoLoaded value)? loaded,
    TResult Function(VideoError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class VideoInitial implements VideoState {
  const factory VideoInitial() = _$VideoInitialImpl;
}

/// @nodoc
abstract class _$$VideoLoadingImplCopyWith<$Res> {
  factory _$$VideoLoadingImplCopyWith(
          _$VideoLoadingImpl value, $Res Function(_$VideoLoadingImpl) then) =
      __$$VideoLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VideoLoadingImplCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res, _$VideoLoadingImpl>
    implements _$$VideoLoadingImplCopyWith<$Res> {
  __$$VideoLoadingImplCopyWithImpl(
      _$VideoLoadingImpl _value, $Res Function(_$VideoLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VideoLoadingImpl implements VideoLoading {
  const _$VideoLoadingImpl();

  @override
  String toString() {
    return 'VideoState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VideoLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoading value) loading,
    required TResult Function(VideoLoaded value) loaded,
    required TResult Function(VideoError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoading value)? loading,
    TResult? Function(VideoLoaded value)? loaded,
    TResult? Function(VideoError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoading value)? loading,
    TResult Function(VideoLoaded value)? loaded,
    TResult Function(VideoError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class VideoLoading implements VideoState {
  const factory VideoLoading() = _$VideoLoadingImpl;
}

/// @nodoc
abstract class _$$VideoLoadedImplCopyWith<$Res> {
  factory _$$VideoLoadedImplCopyWith(
          _$VideoLoadedImpl value, $Res Function(_$VideoLoadedImpl) then) =
      __$$VideoLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<VideoEntity> videos,
      VideoSource currentSource,
      int currentPage,
      bool hasReachedMax,
      bool isLoadingMore,
      String? error});
}

/// @nodoc
class __$$VideoLoadedImplCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res, _$VideoLoadedImpl>
    implements _$$VideoLoadedImplCopyWith<$Res> {
  __$$VideoLoadedImplCopyWithImpl(
      _$VideoLoadedImpl _value, $Res Function(_$VideoLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videos = null,
    Object? currentSource = null,
    Object? currentPage = null,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
    Object? error = freezed,
  }) {
    return _then(_$VideoLoadedImpl(
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoEntity>,
      currentSource: null == currentSource
          ? _value.currentSource
          : currentSource // ignore: cast_nullable_to_non_nullable
              as VideoSource,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VideoLoadedImpl implements VideoLoaded {
  const _$VideoLoadedImpl(
      {required final List<VideoEntity> videos,
      required this.currentSource,
      required this.currentPage,
      required this.hasReachedMax,
      this.isLoadingMore = false,
      this.error})
      : _videos = videos;

  final List<VideoEntity> _videos;
  @override
  List<VideoEntity> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  final VideoSource currentSource;
  @override
  final int currentPage;
  @override
  final bool hasReachedMax;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? error;

  @override
  String toString() {
    return 'VideoState.loaded(videos: $videos, currentSource: $currentSource, currentPage: $currentPage, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoLoadedImpl &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.currentSource, currentSource) ||
                other.currentSource == currentSource) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_videos),
      currentSource,
      currentPage,
      hasReachedMax,
      isLoadingMore,
      error);

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoLoadedImplCopyWith<_$VideoLoadedImpl> get copyWith =>
      __$$VideoLoadedImplCopyWithImpl<_$VideoLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(videos, currentSource, currentPage, hasReachedMax,
        isLoadingMore, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(videos, currentSource, currentPage, hasReachedMax,
        isLoadingMore, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(videos, currentSource, currentPage, hasReachedMax,
          isLoadingMore, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoading value) loading,
    required TResult Function(VideoLoaded value) loaded,
    required TResult Function(VideoError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoading value)? loading,
    TResult? Function(VideoLoaded value)? loaded,
    TResult? Function(VideoError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoading value)? loading,
    TResult Function(VideoLoaded value)? loaded,
    TResult Function(VideoError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class VideoLoaded implements VideoState {
  const factory VideoLoaded(
      {required final List<VideoEntity> videos,
      required final VideoSource currentSource,
      required final int currentPage,
      required final bool hasReachedMax,
      final bool isLoadingMore,
      final String? error}) = _$VideoLoadedImpl;

  List<VideoEntity> get videos;
  VideoSource get currentSource;
  int get currentPage;
  bool get hasReachedMax;
  bool get isLoadingMore;
  String? get error;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoLoadedImplCopyWith<_$VideoLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VideoErrorImplCopyWith<$Res> {
  factory _$$VideoErrorImplCopyWith(
          _$VideoErrorImpl value, $Res Function(_$VideoErrorImpl) then) =
      __$$VideoErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$VideoErrorImplCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res, _$VideoErrorImpl>
    implements _$$VideoErrorImplCopyWith<$Res> {
  __$$VideoErrorImplCopyWithImpl(
      _$VideoErrorImpl _value, $Res Function(_$VideoErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$VideoErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VideoErrorImpl implements VideoError {
  const _$VideoErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'VideoState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoErrorImplCopyWith<_$VideoErrorImpl> get copyWith =>
      __$$VideoErrorImplCopyWithImpl<_$VideoErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VideoEntity> videos,
            VideoSource currentSource,
            int currentPage,
            bool hasReachedMax,
            bool isLoadingMore,
            String? error)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoInitial value) initial,
    required TResult Function(VideoLoading value) loading,
    required TResult Function(VideoLoaded value) loaded,
    required TResult Function(VideoError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoInitial value)? initial,
    TResult? Function(VideoLoading value)? loading,
    TResult? Function(VideoLoaded value)? loaded,
    TResult? Function(VideoError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitial value)? initial,
    TResult Function(VideoLoading value)? loading,
    TResult Function(VideoLoaded value)? loaded,
    TResult Function(VideoError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class VideoError implements VideoState {
  const factory VideoError(final String message) = _$VideoErrorImpl;

  String get message;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoErrorImplCopyWith<_$VideoErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
