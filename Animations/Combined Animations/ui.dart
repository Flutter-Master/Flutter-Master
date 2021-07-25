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
  // fading animation one
  Animation<double> _fadeAnimationOne;
  // fading animation two
  // with delay
  Animation<double> _fadeAnimationTwo;
  // moving animation one
  Animation<Offset> _slideAnimationBoxOne;
  // moving animation two
  // with delay
  Animation<Offset> _slideAnimationBoxTwo;
  // moving animation three
  // with delay
  Animation<Offset> _slideAnimationBoxThree;

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
    _fadeAnimationOne = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    //initialising the animation
    _fadeAnimationTwo = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        //delay
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    //initialising the animation
    _slideAnimationBoxOne = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    //initialising the animation
    _slideAnimationBoxTwo = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        //delay
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    //initialising the animation
    _slideAnimationBoxThree = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        //delay
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );
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
        onPressed: () async {
          await _controller.forward();
          //await _controller.reverse();
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
              //? fading + moving animation one
              //?
              //?
              SlideTransition(
                position: _slideAnimationBoxOne,
                child: FadeTransition(
                  opacity: _fadeAnimationOne,
                  child: Container(
                    height: 80.0,
                    width: 150.0,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              //? fading + moving animation two
              //?
              //?
              SlideTransition(
                position: _slideAnimationBoxTwo,
                child: FadeTransition(
                  opacity: _fadeAnimationOne,
                  child: Container(
                    height: 80.0,
                    width: 150.0,
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              //? fading + moving animation three
              //?
              //?
              SlideTransition(
                position: _slideAnimationBoxThree,
                child: FadeTransition(
                  opacity: _fadeAnimationTwo,
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
