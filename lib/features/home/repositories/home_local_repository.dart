import 'package:client/features/home/models/song_model.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_local_repository.g.dart';

@riverpod
HomeLocalRepository homeLocalRepository(HomeLocalRepositoryRef ref) {
  return HomeLocalRepository();
}

class HomeLocalRepository {
  final Box box = Hive.box('songs');

  void uploadLocalSong(SongModel song) {
    box.put(song.id, song.toJson());
  }

  List<SongModel> loadSongs() {
    final List<SongModel> songs = [];
    for (final key in box.keys) {
      final dynamic data = box.get(key);
      // Cast the data to Map<String, dynamic>
      if (data is Map) {
        songs.add(SongModel.fromJson(Map<String, dynamic>.from(data)));
      }
    }
    return songs;
  }
}
