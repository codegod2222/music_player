import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:music_player/gen/colors.gen.dart';
import 'package:music_player/models/music_model.dart';
import 'package:music_player/presentation/screens/home_screen/components/music_visualizer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'components/plinko_back_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double soundLevel = 80;
  int currentMusicIndex = 0;

  final assetsAudioPlayer = AssetsAudioPlayer();
  bool isFirstTime = true;
  bool isPlaying = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    assetsAudioPlayer.playlistFinished.listen((isFinished) {
      if (isFinished) {
        setState(() {
          isPlaying = false;
          isFirstTime = true;

          currentMusicIndex == 2
              ? currentMusicIndex = 0
              : currentMusicIndex = currentMusicIndex + 1;
        });
        playButtonHandler();
      }
    });
    assetsAudioPlayer.currentPosition.listen((p) {
      setState(() {
        position = p;
      });
    });

    assetsAudioPlayer.current.listen((d) {
      setState(() {
        duration = d?.audio.duration ?? Duration.zero;
      });
    });
    super.initState();
  }

  playButtonHandler() async {
    if (assetsAudioPlayer.isPlaying.value) {
      await assetsAudioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      if (isFirstTime) {
        await assetsAudioPlayer.open(
          Audio.network(musicList[currentMusicIndex].path,
              metas: Metas(
                title: musicList[currentMusicIndex].title,
                artist: musicList[currentMusicIndex].artist,
              )),
        );
        isFirstTime = false;
      } else {
        await assetsAudioPlayer.play();
      }
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: _buildMainUI(),
      ),
    );
  }

  _buildMainUI() {
    return Container(
      width: 30.sh,
      height: 100.sw,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: ColorName.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const PlinkoBackButton(),
          _buildMusicTitle(),
          _buildSoundSynchronization(),
          _buildAudioControllers(),
          _buildSoundControllers(),
        ],
      ),
    );
  }

  _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Music',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        RichText(
          text: TextSpan(
            text: '237 ',
            style: Theme.of(context).textTheme.titleSmall,
            children: [
              TextSpan(
                  text: ' Online',
                  style: TextStyle(
                    color: ColorName.lightPink.withOpacity(0.7),
                  ))
            ],
          ),
        )
      ],
    );
  }

  _buildMusicTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarqueeText(
          speed: 25,
          text: TextSpan(
            text: musicList[currentMusicIndex].title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          musicList[currentMusicIndex].artist,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: ColorName.lightPink.withOpacity(0.7),
              ),
        )
      ],
    );
  }

  _buildSoundSynchronization() {
    return Container(
      width: 100.sh,
      height: 400,
      margin: const EdgeInsets.symmetric(vertical: 50),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorName.foregroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: MusicVisualizer(
          isPlaying: isPlaying,
        ),
      ),
    );
  }

  _buildAudioControllers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 8.sh,
          height: 80,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.foregroundColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                final to = position.inSeconds - 10;
                assetsAudioPlayer.seek(Duration(
                  seconds: to,
                ));
              },
              child: const Icon(
                Icons.fast_rewind,
                size: 50,
                color: ColorName.white,
              )),
        ),
        SizedBox(
          width: 8.sh,
          height: 80,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF82CF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: playButtonHandler,
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 50,
                color: const Color(0xFF5C0039),
              )),
        ),
        SizedBox(
          width: 8.sh,
          height: 80,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.foregroundColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              onPressed: () async {
                final to = position.inSeconds + 10;
                assetsAudioPlayer.seek(Duration(
                  seconds: to,
                ));
              },
              child: const Icon(
                Icons.fast_forward,
                size: 50,
                color: ColorName.white,
              )),
        )
      ],
    );
  }

  _buildSoundControllers() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              if ((soundLevel - 10) >= 0) {
                setState(() {
                  soundLevel -= 10;
                });
              } else {
                setState(() {
                  soundLevel = 0;
                });
              }
              assetsAudioPlayer.setVolume((soundLevel / 100));
            },
            icon: const Icon(
              Icons.volume_mute,
              size: 35,
              color: ColorName.lightPink,
            ),
          ),
          SizedBox(
            width: 20.sh,
            child: Slider(
              value: position.inSeconds.toDouble(),
              max: duration.inSeconds.toDouble(),
              onChanged: (value) async {
                Duration newDuration = Duration(seconds: value.toInt());
                assetsAudioPlayer.seek(newDuration);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              if ((soundLevel + 10) <= 100) {
                setState(() {
                  soundLevel += 10;
                });
              } else {
                setState(() {
                  soundLevel = 100;
                });
              }
              assetsAudioPlayer.setVolume((soundLevel / 100));
            },
            icon: const Icon(
              Icons.volume_up,
              size: 35,
              color: ColorName.lightPink,
            ),
          )
        ],
      ),
    );
  }
}
