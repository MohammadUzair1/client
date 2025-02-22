import 'dart:convert';
import 'dart:io';

import 'package:client/core/constants/server_constants.dart';
import 'package:client/core/failure/failure.dart';
import 'package:client/features/home/models/song_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository();
}

class HomeRepository {
  Future<Either<AppFailure, String>> uploadSong({
    required String token,
    required File selectedAudio,
    required File selectedThumbnail,
    required String songName,
    required String artistName,
    required String hexCode,
  }) async {
    try {
      final req = http.MultipartRequest(
          'POST', Uri.parse('${ServerConstants.BASE_URL}/song/upload'));
      req
        ..files.addAll(
          [
            await http.MultipartFile.fromPath(
              'song',
              selectedAudio.path,
            ),
            await http.MultipartFile.fromPath(
              'thumbnail',
              selectedThumbnail.path,
            )
          ],
        )
        ..fields.addAll({
          'artist': artistName,
          'song_name': songName,
          'hex_code': hexCode,
        })
        ..headers.addAll({
          'x-auth-token': token,
        });

      final res = await req.send();

      if (res.statusCode != 201) {
        return Left(AppFailure(await res.stream.bytesToString()));
      }

      return Right(await res.stream.bytesToString());
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, List<SongModel>>> getAllSongs(
      {required String token}) async {
    try {
      final res = await http.get(
        Uri.parse('${ServerConstants.BASE_URL}/song/list'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );
      var resBody = jsonDecode(res.body);

      if (res.statusCode != 200) {
        resBody = resBody as Map<String, dynamic>;
        return Left(AppFailure(resBody['detail']));
      }
      resBody = resBody as List;
      List<SongModel> songs = [];
      for (final map in resBody) {
        songs.add(SongModel.fromJson(map));
      }
      return Right(songs);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, bool>> favSong({
    required String token,
    required String songId,
  }) async {
    try {
      final res = await http.post(
          Uri.parse('${ServerConstants.BASE_URL}/song/favorite'),
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token': token,
          },
          body: jsonEncode({
            'song_id': songId,
          }));
      var resBody = jsonDecode(res.body);

      if (res.statusCode != 200) {
        resBody = resBody as Map<String, dynamic>;
        return Left(AppFailure(resBody['detail']));
      }

      return Right(resBody['message']);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, List<SongModel>>> getAllFavSongs(
      {required String token}) async {
    try {
      final res = await http.get(
        Uri.parse('${ServerConstants.BASE_URL}/song/list/favorites'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );
      var resBody = jsonDecode(res.body);

      if (res.statusCode != 200) {
        resBody = resBody as Map<String, dynamic>;
        return Left(AppFailure(resBody['detail']));
      }
      resBody = resBody as List;
      List<SongModel> songs = [];
      for (final map in resBody) {
        songs.add(SongModel.fromJson(map['song']));
      }
      return Right(songs);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
