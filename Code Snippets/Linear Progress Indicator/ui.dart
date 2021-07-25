import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // controller for animation
  AnimationController _progressController;
  // animation
  Animation<double> _progressAnimation;

  // keeping track of progress
  double _progress = 0.0;

  // whether in progress
  bool _inProgress = false;
  // whether download is complete
  bool _isDownloaded = false;

  /// on Raised Button pressed
  void buttonPressed() {
    setState(() {
      if (_isDownloaded) {
        // push to next page
        // if download is complete
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PageTwo()),
        );
      } else {
        // otherwise play the animation
        _progressController.forward();
        _inProgress = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // initialising controller
    _progressController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // initialising animation
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _progressController,
        curve: Curves.easeOut,
      ),
      // adding listener to the animation
    )..addListener(() {
        _progress = _progressAnimation.value;
        if (_progressAnimation.isCompleted) {
          print('completed');
          _inProgress = false;
          _isDownloaded = true;
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    // disposing controller when
    // not in use
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // card
        child: Container(
          height: 200.0,
          width: 300.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                offset: Offset(0.0, 2.0),
                color: Colors.black.withOpacity(0.15),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LinearProgressIndicator(
                // current value of indicator
                value: _progress,
                // selecting color according
                // to the value
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.lerp(Colors.yellow, Colors.pink, _progress),
                ),
                // inactive bar color
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Text((_progress * 100).toStringAsFixed(0) + '%'),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    height: 50.0,
                    width: 120.0,
                    child: MaterialButton(
                      disabledColor: Colors.grey,
                      color: Colors.pink,
                      onPressed: _inProgress ? null : buttonPressed,
                      child: Text(
                        _isDownloaded ? 'Done' : 'Download',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
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

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
