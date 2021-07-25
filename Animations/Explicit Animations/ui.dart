import 'package:flutter/material.dart';

class UI extends StatefulWidget {
  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> with SingleTickerProviderStateMixin {
  // used to control the animation
  //
  // a single controller can be used to
  // control more than one animation
  AnimationController _controller;
  // fading animation
  Animation<double> _fadeAnimation;
  // scaling animation
  Animation<double> _scaleAnimation;
  // moving animation
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // initialising the controller
    _controller = AnimationController(
      // this class
      vsync: this,
      // animation will play for 1 second
      duration: const Duration(seconds: 1),
    );

    //initialising the animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    //initialising the animation
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    //initialising the animation
    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(-1.0, 0.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    // disposing the controller when
    // not in user
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            // will repeat animation forever
            _controller.repeat(reverse: true);
          }
        },
      ),
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
              //? fading animation
              //?
              //?
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              //? scaling animation
              //?
              //?
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              //? moving animation
              //?
              //?
              SlideTransition(
                position: _slideAnimation,
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
