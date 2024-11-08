// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'fav_song_model.freezed.dart';
part 'fav_song_model.g.dart';

@freezed
class FavSongModel with _$FavSongModel {
  const factory FavSongModel({
    required String id,
    required String song_id,
    required String user_id,
  }) = _FavSongModel;

  factory FavSongModel.fromJson(Map<String, dynamic> json) =>
      _$FavSongModelFromJson(json);
}
