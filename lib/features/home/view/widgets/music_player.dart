import 'package:client/core/providers/current_song_notifier.dart';
import 'package:client/core/providers/current_user_notifier.dart';
import 'package:client/core/theme/app_pallette.dart';
import 'package:client/core/utils/utils.dart';
import 'package:client/features/home/models/song_model.dart';
import 'package:client/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicPlayer extends ConsumerWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSong = ref.watch(currentSongNotifierProvider);
    final currentSongNotifier = ref.read(currentSongNotifierProvider.notifier);
    final userFavs = ref
        .watch(currentUserNotifierProvider.select((data) => data!.favorites));

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            hexToColor(currentSong!.hex_code),
            hexToColor(currentSong.hex_code).withOpacity(0.1),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Transform.translate(
            offset: Offset(-15, 0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/pull-down-arrow.png',
                  color: Pallete.whiteColor,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Hero(
                  tag: 'music-image',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(currentSong.thumbnail_url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentSong.song_name,
                            style: const TextStyle(
                              color: Pallete.whiteColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            currentSong.artist,
                            style: const TextStyle(
                              color: Pallete.subtitleText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
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
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      StreamBuilder(
                          stream:
                              currentSongNotifier.audioPlayer!.positionStream,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox();
                            }
                            final position = snapshot.data;
                            final duration =
                                currentSongNotifier.audioPlayer?.duration;

                            var sliderValue =
                                position != null && duration != null
                                    ? position.inMilliseconds /
                                        duration.inMilliseconds
                                    : 0.0;
                            return Column(
                              children: [
                                StatefulBuilder(builder: (context, setS) {
                                  return SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      thumbColor: Pallete.whiteColor,
                                      activeTrackColor: Pallete.whiteColor,
                                      inactiveTrackColor:
                                          Pallete.whiteColor.withOpacity(0.117),
                                      trackHeight: 4,
                                      overlayShape:
                                          SliderComponentShape.noOverlay,
                                    ),
                                    child: Slider(
                                      value: sliderValue,
                                      max: 1,
                                      min: 0,
                                      onChanged: (v) {
                                        sliderValue = v;
                                        setS(() {});
                                      },
                                      onChangeEnd: (v) {
                                        currentSongNotifier.seek(v);
                                      },
                                    ),
                                  );
                                }),
                                Row(
                                  children: [
                                    Text(
                                      '${position!.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}',
                                      style: const TextStyle(
                                        color: Pallete.subtitleText,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '${duration!.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                                      style: TextStyle(
                                        color: Pallete.subtitleText,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/shuffle.png',
                              color: Pallete.whiteColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/previus-song.png',
                              color: Pallete.whiteColor,
                            ),
                          ),
                          IconButton(
                            onPressed: currentSongNotifier.playPause,
                            icon: Icon(
                              currentSongNotifier.isPlaying
                                  ? CupertinoIcons.pause_circle_fill
                                  : CupertinoIcons.play_circle_fill,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/next-song.png',
                              color: Pallete.whiteColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/repeat.png',
                              color: Pallete.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/connect-device.png',
                              color: Pallete.whiteColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/playlist.png',
                              color: Pallete.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
