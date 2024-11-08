import 'package:client/core/providers/current_song_notifier.dart';
import 'package:client/core/theme/app_pallette.dart';
import 'package:client/core/widgets/loader.dart';
import 'package:client/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getFavSongsProvider).when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (c, index) => ListTile(
                onTap: () {
                  ref.read(currentSongNotifierProvider.notifier).updateSong(
                        data[index],
                      );
                },
                leading: CircleAvatar(
                  radius: 35,
                  backgroundColor: Pallete.backgroundColor,
                  backgroundImage: NetworkImage(data[index].thumbnail_url),
                ),
                title: Text(
                  data[index].song_name,
                  style: const TextStyle(
                    color: Pallete.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text(
                  data[index].artist,
                  style: const TextStyle(
                    color: Pallete.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          },
          error: (error, st) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () => const Loader(),
        );
  }
}
