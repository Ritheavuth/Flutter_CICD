import 'package:flutter/material.dart';
import 'package:vgo_app/constants/palette.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: "226moG7EH58",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller!,
      showVideoProgressIndicator: false,
      progressIndicatorColor: Palette.primaryColor,
      progressColors: const ProgressBarColors(
        playedColor: Palette.primaryColor,
        handleColor: Palette.primaryColor,
      ),
      bottomActions: [
        CurrentPosition(),
        ProgressBar(isExpanded: true),
        RemainingDuration(),
      ],
      onReady: () {
        _controller!.addListener(() {});
      },
    );
  }
}
