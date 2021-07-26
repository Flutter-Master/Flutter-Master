import 'dart:async';

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../core/navigation.dart';
import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //Controller for animation
  late final AnimationController _animationController;
  //Color animation fot the black layer
  late final Animation<Color?> _colorAnimation;
  //The title animations fade in
  late final Animation<double> _nameAnimation;
  //quote animation fade in
  late final Animation<double> _quoteAnimation;

  @override
  void initState() {
    super.initState();
    //Initialize controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _colorAnimation = ColorTween(
      begin: Colors.black.withOpacity(0),
      end: Colors.black.withOpacity(0.8),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.4, curve: Curves.easeInOut),
      ),
    );

    _nameAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 0.7, curve: Curves.easeIn),
      ),
    );

    _quoteAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1, curve: Curves.easeIn),
      ),
    );

    //Starts animation
    _animationController.forward();

    _animationController.addStatusListener((status) async {
//After animation is completed navigate to Home screen
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(milliseconds: 1000));
        scheduleMicrotask(() {
          navigate(context, const HomeScreen());
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.removeStatusListener((_) {});
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.fill,
              ),
            ),
            //The Black Overlay Animation
            child: AnimatedBuilder(
              animation: _colorAnimation,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  color: _colorAnimation.value,
                );
              },
            ),
          ),

          Hero(
            tag: 'tourve',
            child: Material(
              type: MaterialType.transparency,
              child: Align(
                child: FadeTransition(
                  opacity: _nameAnimation,
                  child: const Text(
                    'TOURVE',
                    style: kLargeTitle,
                  ),
                ),
              ),
            ),
          ),

          //QUOTE
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: FadeTransition(
                opacity: _quoteAnimation,
                child: const Text(
                  'BE A TRAVELLER NOT A TOURIST',
                  style: kQuoteStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
