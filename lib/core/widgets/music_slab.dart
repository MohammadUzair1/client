import 'package:client/core/providers/current_song_notifier.dart';
import 'package:client/core/providers/current_user_notifier.dart';
import 'package:client/core/theme/app_pallette.dart';
import 'package:client/core/utils/utils.dart';
import 'package:client/features/home/view/widgets/music_player.dart';
import 'package:client/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicSlab extends ConsumerWidget {
  const MusicSlab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSong = ref.watch(currentSongNotifierProvider);
    final songNotifier = ref.read(currentSongNotifierProvider.notifier);
    final userFavs = ref
        .watch(currentUserNotifierProvider.select((data) => data!.favorites));
    if (currentSong == null) return const SizedBox();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (_, animation, secondayAnim) => const MusicPlayer(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween = Tween(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).chain(CurveTween(
                curve: Curves.easeIn,
              ));
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            }));
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: hexToColor(currentSong.hex_code),
              borderRadius: BorderRadius.circular(4),
            ),
            height: 66,
            width: MediaQuery.of(context).size.width - 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: 'music-image',
                      child: Container(
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(currentSong.thumbnail_url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentSong.song_name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          currentSong.artist,
                          style: const TextStyle(
                            color: Pallete.subtitleText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        await ref
                            .read(homeViewModelProvider.notifier)
                            .favSong(songId: currentSong.id);
                      },
                      icon: Icon(
                        userFavs!
                                .where((fav) => fav.song_id == currentSong.id)
                                .toList()
                                .isNotEmpty
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        songNotifier.playPause();
                      },
                      icon: Icon(
                        songNotifier.isPlaying
                            ? CupertinoIcons.pause_fill
                            : CupertinoIcons.play_fill,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          StreamBuilder(
              stream: songNotifier.audioPlayer?.positionStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                }
                final position = snapshot.data;
                final duration = songNotifier.audioPlayer?.duration;

                final sliderValue = position != null && duration != null
                    ? position.inMilliseconds / duration.inMilliseconds
                    : 0.0;

                return Positioned(
                  bottom: 0,
                  left: 8,
                  child: Container(
                    height: 2,
                    width:
                        sliderValue * (MediaQuery.of(context).size.width - 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Pallete.whiteColor,
                    ),
                  ),
                );
              }),
          Positioned(
            bottom: 0,
            left: 8,
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Pallete.inactiveSeekColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
