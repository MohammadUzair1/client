// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongModel _$SongModelFromJson(Map<String, dynamic> json) {
  return _SongModel.fromJson(json);
}

/// @nodoc
mixin _$SongModel {
  String get thumbnail_url => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get song_url => throw _privateConstructorUsedError;
  String get artist => throw _privateConstructorUsedError;
  String get song_name => throw _privateConstructorUsedError;
  String get hex_code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongModelCopyWith<SongModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongModelCopyWith<$Res> {
  factory $SongModelCopyWith(SongModel value, $Res Function(SongModel) then) =
      _$SongModelCopyWithImpl<$Res, SongModel>;
  @useResult
  $Res call(
      {String thumbnail_url,
      String id,
      String song_url,
      String artist,
      String song_name,
      String hex_code});
}

/// @nodoc
class _$SongModelCopyWithImpl<$Res, $Val extends SongModel>
    implements $SongModelCopyWith<$Res> {
  _$SongModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail_url = null,
    Object? id = null,
    Object? song_url = null,
    Object? artist = null,
    Object? song_name = null,
    Object? hex_code = null,
  }) {
    return _then(_value.copyWith(
      thumbnail_url: null == thumbnail_url
          ? _value.thumbnail_url
          : thumbnail_url // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      song_url: null == song_url
          ? _value.song_url
          : song_url // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      song_name: null == song_name
          ? _value.song_name
          : song_name // ignore: cast_nullable_to_non_nullable
              as String,
      hex_code: null == hex_code
          ? _value.hex_code
          : hex_code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongModelImplCopyWith<$Res>
    implements $SongModelCopyWith<$Res> {
  factory _$$SongModelImplCopyWith(
          _$SongModelImpl value, $Res Function(_$SongModelImpl) then) =
      __$$SongModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String thumbnail_url,
      String id,
      String song_url,
      String artist,
      String song_name,
      String hex_code});
}

/// @nodoc
class __$$SongModelImplCopyWithImpl<$Res>
    extends _$SongModelCopyWithImpl<$Res, _$SongModelImpl>
    implements _$$SongModelImplCopyWith<$Res> {
  __$$SongModelImplCopyWithImpl(
      _$SongModelImpl _value, $Res Function(_$SongModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail_url = null,
    Object? id = null,
    Object? song_url = null,
    Object? artist = null,
    Object? song_name = null,
    Object? hex_code = null,
  }) {
    return _then(_$SongModelImpl(
      thumbnail_url: null == thumbnail_url
          ? _value.thumbnail_url
          : thumbnail_url // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      song_url: null == song_url
          ? _value.song_url
          : song_url // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      song_name: null == song_name
          ? _value.song_name
          : song_name // ignore: cast_nullable_to_non_nullable
              as String,
      hex_code: null == hex_code
          ? _value.hex_code
          : hex_code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongModelImpl implements _SongModel {
  const _$SongModelImpl(
      {required this.thumbnail_url,
      required this.id,
      required this.song_url,
      required this.artist,
      required this.song_name,
      required this.hex_code});

  factory _$SongModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongModelImplFromJson(json);

  @override
  final String thumbnail_url;
  @override
  final String id;
  @override
  final String song_url;
  @override
  final String artist;
  @override
  final String song_name;
  @override
  final String hex_code;

  @override
  String toString() {
    return 'SongModel(thumbnail_url: $thumbnail_url, id: $id, song_url: $song_url, artist: $artist, song_name: $song_name, hex_code: $hex_code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongModelImpl &&
            (identical(other.thumbnail_url, thumbnail_url) ||
                other.thumbnail_url == thumbnail_url) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.song_url, song_url) ||
                other.song_url == song_url) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.song_name, song_name) ||
                other.song_name == song_name) &&
            (identical(other.hex_code, hex_code) ||
                other.hex_code == hex_code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, thumbnail_url, id, song_url, artist, song_name, hex_code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongModelImplCopyWith<_$SongModelImpl> get copyWith =>
      __$$SongModelImplCopyWithImpl<_$SongModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongModelImplToJson(
      this,
    );
  }
}

abstract class _SongModel implements SongModel {
  const factory _SongModel(
      {required final String thumbnail_url,
      required final String id,
      required final String song_url,
      required final String artist,
      required final String song_name,
      required final String hex_code}) = _$SongModelImpl;

  factory _SongModel.fromJson(Map<String, dynamic> json) =
      _$SongModelImpl.fromJson;

  @override
  String get thumbnail_url;
  @override
  String get id;
  @override
  String get song_url;
  @override
  String get artist;
  @override
  String get song_name;
  @override
  String get hex_code;
  @override
  @JsonKey(ignore: true)
  _$$SongModelImplCopyWith<_$SongModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
