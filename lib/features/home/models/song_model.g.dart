// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongModelImpl _$$SongModelImplFromJson(Map<String, dynamic> json) =>
    _$SongModelImpl(
      thumbnail_url: json['thumbnail_url'] as String,
      id: json['id'] as String,
      song_url: json['song_url'] as String,
      artist: json['artist'] as String,
      song_name: json['song_name'] as String,
      hex_code: json['hex_code'] as String,
    );

Map<String, dynamic> _$$SongModelImplToJson(_$SongModelImpl instance) =>
    <String, dynamic>{
      'thumbnail_url': instance.thumbnail_url,
      'id': instance.id,
      'song_url': instance.song_url,
      'artist': instance.artist,
      'song_name': instance.song_name,
      'hex_code': instance.hex_code,
    };
