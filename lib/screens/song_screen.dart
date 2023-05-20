import 'dart:async';

import 'package:flutter/material.dart';
import '../models/song_model.dart';
import 'package:audioplayers/audioplayers.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key, required this.response}) : super(key: key);
  final SongModel response;
  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final StreamController<double> _positionStreamController =
      StreamController<double>();

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    // listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      position = newPosition;
    });
    Timer? timer;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final currentPosition = await audioPlayer.getCurrentPosition();
      if (mounted) {
        setState(() {});
      }
      _positionStreamController.sink
          .add(currentPosition?.inMilliseconds.toDouble() ?? 0.0);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.response.image.toString();
    
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Music Detail Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  height: MediaQuery.of(context).size.height / 2.75,
                  url,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                widget.response.title.toString(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.response.artist.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              StreamBuilder(
                stream: _positionStreamController.stream,
                builder: (context, snapshot) {
                  // final currentPosition = snapshot.data;
                  return SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        trackHeight: 4,
                        thumbShape: const RoundSliderThumbShape(
                            disabledThumbRadius: 4, enabledThumbRadius: 4),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 10,
                        ),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white.withOpacity(0.2),
                        thumbColor: Colors.white,
                        overlayColor: Colors.white),
                    child: Slider(
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) async {
                          final position = Duration(seconds: value.toInt());
                          await audioPlayer.seek(position);
                          // optional :Play audio if was paused
                          await audioPlayer.resume();
                        }),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    onPressed: () async {},
                    icon: const Icon(Icons.skip_previous),
                    iconSize: 40,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.resume();
                      }
                    },
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 40,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    onPressed: () async {},
                    icon: const Icon(Icons.skip_next),
                    iconSize: 40,
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setAudio() async {
    // Repeat song when completed
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    await audioPlayer.setSourceUrl(widget.response.source.toString());
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, twoDigitMinutes, twoDigitSeconds]
        .join(':');
  }
}
