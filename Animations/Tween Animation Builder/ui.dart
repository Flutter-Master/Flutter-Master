// getting value of pi for rotation
import 'dart:math' as math;

import 'package:flutter/material.dart';

class UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        //centered container
        child: Container(
          height: 400.0,
          width: 300.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10.0,
                offset: const Offset(0.0, 3.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //? Rotation Animation
              //?
              TweenAnimationBuilder<double>(
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                tween: Tween<double>(begin: 0.0, end: 1.0),
                builder: (context, tween, child) {
                  return Transform.rotate(
                    angle: 2 * math.pi * tween,
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      color: Colors.green,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              //? Changing Color Animation
              //?
              TweenAnimationBuilder<Color>(
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                tween: ColorTween(begin: Colors.yellow, end: Colors.red),
                builder: (context, tween, child) {
                  return Container(
                    height: 80.0,
                    width: 80.0,
                    color: tween,
                  );
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              //? Sliding Animation
              //?
              TweenAnimationBuilder<Offset>(
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                tween: Tween<Offset>(
                  begin: Offset(-100.0, 0.0),
                  end: Offset(0.0, 0.0),
                ),
                builder: (context, tween, child) {
                  return Transform.translate(
                    offset: tween,
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      color: Colors.purple,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
