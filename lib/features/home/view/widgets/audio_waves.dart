import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:client/core/theme/app_pallette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioWaves extends StatefulWidget {
  final String path;
  const AudioWaves({super.key, required this.path});

  @override
  State<AudioWaves> createState() => _AudioWavesState();
}

class _AudioWavesState extends State<AudioWaves> {
  final PlayerController playerController = PlayerController();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  void initPlayer() async {
    await playerController.preparePlayer(path: widget.path);
  }

  Future<void> playAndPause() async {
    if (!playerController.playerState.isPlaying) {
      await playerController.startPlayer(finishMode: FinishMode.stop);
    } else if (!playerController.playerState.isPaused) {
      await playerController.pausePlayer();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: playAndPause,
          icon: Icon(
            playerController.playerState.isPlaying
                ? CupertinoIcons.pause_solid
                : CupertinoIcons.play_arrow_solid,
          ),
        ),
        Expanded(
          child: AudioFileWaveforms(
            playerController: playerController,
            size: const Size(double.infinity, 100),
            backgroundColor: Colors.black,
            playerWaveStyle: const PlayerWaveStyle(
              fixedWaveColor: Pallete.borderColor,
              liveWaveColor: Pallete.gradient1,
              spacing: 6.0,
              showSeekLine: false,
            ),
            // waveformType: WaveformType.fitWidth,
          ),
        ),
      ],
    );
  }
}
