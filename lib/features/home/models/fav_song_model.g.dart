// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavSongModelImpl _$$FavSongModelImplFromJson(Map<String, dynamic> json) =>
    _$FavSongModelImpl(
      id: json['id'] as String,
      song_id: json['song_id'] as String,
      user_id: json['user_id'] as String,
    );

Map<String, dynamic> _$$FavSongModelImplToJson(_$FavSongModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'song_id': instance.song_id,
      'user_id': instance.user_id,
    };
