import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'expense_page_view.dart';

class IncomeGraph extends StatefulWidget {
  @override
  _IncomeGraphState createState() => _IncomeGraphState();
}

class _IncomeGraphState extends State<IncomeGraph>
    with SingleTickerProviderStateMixin {
  // animation controller
  AnimationController _controller;
  // rings animation
  Animation _tweenAnimation;

  @override
  void initState() {
    super.initState();
    // initialising the controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addListener(() {
        setState(() {});
      });

    // initialising the animation
    _tweenAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    // playing the animation
    _playAnimation();
  }

  // will play animation after some delay
  void _playAnimation() async {
    // delay
    await Future.delayed(const Duration(milliseconds: 200));
    // playing the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // disposing the controller when
    // not in use
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 250.0,
      child: CustomPaint(
        painter: RingsPainter(
          blueAngle: 1.95 * math.pi * _tweenAnimation.value,
          purpleAngle: 2 * math.pi / 3 * _tweenAnimation.value,
          yellowAngle: 0.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Total earned',
                style: TextStyle(
                  color: kPrimaryTextColor.withOpacity(0.5),
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 1.0,
              ),
              Text(
                '\$10,254',
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
