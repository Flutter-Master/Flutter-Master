import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//! Don't forget to first add the
//! the dependency for flutter_hooks
//! in your pubspec.yaml file

// This call uses AnimationController
// in traditional way without hooks
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    //initialising animation controller
    _controller = AnimationController(
      vsync: this,
      // setting duration of animation
      // to 2 seconds
      duration: const Duration(seconds: 2),
    );
    // playing the animation in forward
    // direction
    _controller.forward();
  }

  @override
  void dispose() {
    //disposing the controller when not needed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // using fade-transition to
        // fade in the Flutter logo
        child: FadeTransition(
          // adjusting opacity with the controller
          opacity: _controller,
          child: FlutterLogo(
            size: 100.0,
          ),
        ),
      ),
    );
  }
}

// This call uses AnimationController
// from the flutter_hooks package
class HomeWithHooks extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // using the animation controller
    // from flutter hooks package
    final AnimationController controller = useAnimationController(
      // setting duration of animation
      // to 2 seconds
      duration: const Duration(seconds: 2),
    );
    // playing the animation in forward
    // direction
    controller.forward();
    // similar widget tree as before
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: controller,
          child: FlutterLogo(
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
