// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'song_model.freezed.dart';
part 'song_model.g.dart';

@freezed
class SongModel with _$SongModel {
  const factory SongModel({
    required String thumbnail_url,
    required String id,
    required String song_url,
    required String artist,
    required String song_name,
    required String hex_code,
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);
}
