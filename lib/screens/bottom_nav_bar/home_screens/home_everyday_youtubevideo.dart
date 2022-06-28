import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeEveryDayYoutubeVideo extends StatefulWidget {
  final String videoLink;
  final String title;
  final String description;

  const HomeEveryDayYoutubeVideo({
    Key? key,
    required this.videoLink,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<HomeEveryDayYoutubeVideo> createState() =>
      _HomeEveryDayYoutubeVideoState();
}

class _HomeEveryDayYoutubeVideoState extends State<HomeEveryDayYoutubeVideo> {
  late YoutubePlayerController _controller;
  late YoutubeMetaData _videoMetaData;

  bool _isPlayerReady = false;
  late PlayerState _playerState;

  var videoId;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId =
          YoutubePlayer.convertUrlToId(widget.videoLink).toString(),
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        loop: true,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            ClipRRect(
              child: Image.asset(
                youtubePlayerImg,
                height: screenheight,
                width: screenwidth,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 9,
                  child: YoutubePlayer(
                    controller: _controller,
                    aspectRatio: 16 / 16,
                    showVideoProgressIndicator: true,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.white,
                      handleColor: Colors.white,
                    ),
                    onReady: () {
                      _controller.addListener(listener);
                    },
                    topActions: <Widget>[
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          _controller.metadata.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const PlaybackSpeedButton(),
                      const SizedBox(
                        width: 8.0,
                      ),
                    ],
                    bottomActions: [
                      const SizedBox(
                        width: 3,
                      ),
                      CurrentPosition(),
                      const SizedBox(
                        width: 5,
                      ),
                      ProgressBar(isExpanded: true),
                      const SizedBox(
                        width: 5,
                      ),
                      RemainingDuration(),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'YouTube',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                    child: SizedBox()
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 22
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        widget.description.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
