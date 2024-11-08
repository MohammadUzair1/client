// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fav_song_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavSongModel _$FavSongModelFromJson(Map<String, dynamic> json) {
  return _FavSongModel.fromJson(json);
}

/// @nodoc
mixin _$FavSongModel {
  String get id => throw _privateConstructorUsedError;
  String get song_id => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavSongModelCopyWith<FavSongModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavSongModelCopyWith<$Res> {
  factory $FavSongModelCopyWith(
          FavSongModel value, $Res Function(FavSongModel) then) =
      _$FavSongModelCopyWithImpl<$Res, FavSongModel>;
  @useResult
  $Res call({String id, String song_id, String user_id});
}

/// @nodoc
class _$FavSongModelCopyWithImpl<$Res, $Val extends FavSongModel>
    implements $FavSongModelCopyWith<$Res> {
  _$FavSongModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? song_id = null,
    Object? user_id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      song_id: null == song_id
          ? _value.song_id
          : song_id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavSongModelImplCopyWith<$Res>
    implements $FavSongModelCopyWith<$Res> {
  factory _$$FavSongModelImplCopyWith(
          _$FavSongModelImpl value, $Res Function(_$FavSongModelImpl) then) =
      __$$FavSongModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String song_id, String user_id});
}

/// @nodoc
class __$$FavSongModelImplCopyWithImpl<$Res>
    extends _$FavSongModelCopyWithImpl<$Res, _$FavSongModelImpl>
    implements _$$FavSongModelImplCopyWith<$Res> {
  __$$FavSongModelImplCopyWithImpl(
      _$FavSongModelImpl _value, $Res Function(_$FavSongModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? song_id = null,
    Object? user_id = null,
  }) {
    return _then(_$FavSongModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      song_id: null == song_id
          ? _value.song_id
          : song_id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavSongModelImpl implements _FavSongModel {
  const _$FavSongModelImpl(
      {required this.id, required this.song_id, required this.user_id});

  factory _$FavSongModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavSongModelImplFromJson(json);

  @override
  final String id;
  @override
  final String song_id;
  @override
  final String user_id;

  @override
  String toString() {
    return 'FavSongModel(id: $id, song_id: $song_id, user_id: $user_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavSongModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.song_id, song_id) || other.song_id == song_id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, song_id, user_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavSongModelImplCopyWith<_$FavSongModelImpl> get copyWith =>
      __$$FavSongModelImplCopyWithImpl<_$FavSongModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavSongModelImplToJson(
      this,
    );
  }
}

abstract class _FavSongModel implements FavSongModel {
  const factory _FavSongModel(
      {required final String id,
      required final String song_id,
      required final String user_id}) = _$FavSongModelImpl;

  factory _FavSongModel.fromJson(Map<String, dynamic> json) =
      _$FavSongModelImpl.fromJson;

  @override
  String get id;
  @override
  String get song_id;
  @override
  String get user_id;
  @override
  @JsonKey(ignore: true)
  _$$FavSongModelImplCopyWith<_$FavSongModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
