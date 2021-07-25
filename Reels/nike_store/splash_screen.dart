/*

This UI is created for the screen size of iPhone X
(375 x 812 px).

Note that it is not made responsive. If you are seeing it
on any other screen, please change the values respectively.

Don't forget to add dependency for flutter_svg:

dependencies:
  flutter_svg: ^0.17.0
  video_player: ^0.10.12+3

You need to do some native setup for video_player
package

All the required assets are available in the assets
folder.

Created by Flutter Master.
https://www.instagram.com/flutter.master/

 */

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // video controller
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/video_3.mp4',
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown
        // after the video is initialized,
        // even before the play button
        // has been pressed.
        setState(() {});
      })
      // adding listener
      ..addListener(() {
        setState(() {});
      })
      // mute audio
      ..setVolume(0.0);

    // playing video
    _playVideo();
  }

  void _playVideo() async {
    // playing video
    _controller.play();
    // some delay
    await Future.delayed(const Duration(seconds: 4));
    // navigating to home screen
    Navigator.of(context).pushNamed('/');
  }

  @override
  void dispose() {
    // disposing controller when
    // not in use
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                ),
              )
            : Container(),
      ),
    );
  }
}
