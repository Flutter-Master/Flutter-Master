import 'package:flutter/material.dart';
import 'package:testing/nike_shoes/constants.dart';
import 'package:testing/nike_shoes/top_section.dart';

import 'bottom_section.dart';
import 'middle_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // animation controller
  AnimationController _controller;
  // slide animation for top section
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // initialising the controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // initialising the animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    // playing animation
    _playAnimation();
  }

  void _playAnimation() async {
    // some delay
    await Future.delayed(const Duration(milliseconds: 300));
    // playing animation in forward direction
    _controller.forward();
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
      backgroundColor: kBlackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SlideTransition(
            position: _slideAnimation,
            child: TopSection(),
          ),
          Expanded(
            child: MiddleSection(),
          ),
          BottomSection(),
        ],
      ),
    );
  }
}
