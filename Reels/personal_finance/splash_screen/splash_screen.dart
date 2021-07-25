/*

This UI is created for the screen size of iPhone X
(375 x 812 px).

Note that it is not made responsive. If you are seeing it
on any other screen, please change the values respectively.

Don't forget to add dependency for flutter_svg:

dependencies:
  flutter_svg: ^0.17.0

All the required assets are available in the assets
folder.

Created by Flutter Master.
https://www.instagram.com/flutter.master/

 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing/personal_finance/constants.dart';
import 'package:testing/personal_finance/finance_screen/finance_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SplashScreenDesign(),
      ),
    );
  }
}

/// Design of Splash Screen
class SplashScreenDesign extends StatefulWidget {
  @override
  _SplashScreenDesignState createState() => _SplashScreenDesignState();
}

class _SplashScreenDesignState extends State<SplashScreenDesign>
    with SingleTickerProviderStateMixin {
  // controller for rotation animations
  AnimationController _controller;
  // reverse rotation animation
  Animation<double> _reverseRotation;

  @override
  void initState() {
    super.initState();
    // initialising the controller
    _controller = AnimationController(
      vsync: this,
      // long duration for slow motion
      duration: const Duration(seconds: 20),
    );

    // initialising reverse animation
    _reverseRotation = Tween<double>(
      begin: 0.0,
      end: -1.0,
    ).animate(_controller);

    // play animation
    _playAnimation();
  }

  // will play animation after some delay
  void _playAnimation() async {
    // delay
    await Future.delayed(const Duration(milliseconds: 500));
    // playing animation
    _controller.forward();
    // more delay
    await Future.delayed(const Duration(seconds: 4));
    // navigating to next screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FinanceScreen(),
      ),
    );
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
    return Stack(
      children: <Widget>[
        // background
        Container(
          width: double.infinity,
          height: double.infinity,
        ),
        // custom paint
        CustomPaint(
          painter: SplashScreenCustomPainter(),
          child: Container(),
        ),
        // blue plus
        Positioned(
          left: 40.0,
          top: 90.0,
          child: RotationTransition(
            turns: _reverseRotation,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/blue_plus.svg',
            ),
          ),
        ),
        // left dots
        Positioned(
          left: -5.0,
          top: 200.0,
          child: SvgPicture.asset(
            'assets/dots.svg',
          ),
        ),
        // purple plus
        Positioned(
          right: 145.0,
          top: 180.0,
          child: RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 0.5,
            ).animate(_controller),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/purple_plus.svg',
            ),
          ),
        ),
        // purple triangle
        Positioned(
          left: 105.0,
          top: 325.0,
          child: RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: -0.5,
            ).animate(_controller),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/purple_triangle.svg',
            ),
          ),
        ),
        // blue triangle
        Positioned(
          right: 80.0,
          top: 400.0,
          child: RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 0.5,
            ).animate(_controller),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/blue_triangle.svg',
            ),
          ),
        ),
        // Personal
        Positioned(
          left: 40.0,
          bottom: 140.0,
          child: Text(
            'Personal',
            style: TextStyle(
              color: const Color(0xFF9166FE),
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        // Finance
        Positioned(
          left: 40.0,
          bottom: 82.0,
          child: Text(
            'Finance',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

/// Custom Painter class for painting the background
class SplashScreenCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double _width = size.width;
    final double _height = size.height;

    Paint _paint = Paint()..color = kPurpleColor;
    canvas.drawRect(Rect.fromLTWH(0.0, 0.0, _width, _height), _paint);

    _paint.color = kOrangeColor;
    canvas.drawCircle(
      Offset(0, _height / 1.9),
      80.0,
      _paint,
    );

    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = 6.0;
    canvas.drawCircle(
      Offset(_width / 2.3, _height / 1.45),
      25.0,
      _paint,
    );

    _paint.strokeWidth = 10.0;
    canvas.drawCircle(
      Offset(_width / 2.1, _height / 50),
      85.0,
      _paint,
    );

    _paint.color = kBlueColor;
    _paint.strokeWidth = 13.0;
    canvas.drawCircle(
      Offset(_width * 1.05, _height / 3),
      125.0,
      _paint,
    );

    _paint.color = const Color(0xFF7646EE);
    _paint.strokeWidth = 10.0;
    canvas.drawCircle(
      Offset(_width * 1, _height / 1.3),
      62.0,
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
