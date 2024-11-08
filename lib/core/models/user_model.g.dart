// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((e) => FavSongModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
      'favorites': instance.favorites,
      'token': instance.token,
    };
