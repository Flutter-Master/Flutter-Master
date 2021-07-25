import 'package:flutter/material.dart';

class UI extends StatefulWidget {
  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  // keeping track of opacity
  //
  // completely invisible at the start
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // changing opacity
    changeOpacityLater();
  }

  /// Will change opacity after 2 seconds
  void changeOpacityLater() async {
    // delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // full opacity
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
          child: AnimatedOpacity(
            // duration of animation
            duration: const Duration(milliseconds: 1000),
            // animation will ease out at the end
            curve: Curves.easeOut,
            // opacity of it's child
            opacity: _opacity,
            // child (dummy list)
            child: MyList(),
          ),
        ),
      ),
    );
  }
}

/// Dummy List
class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(30.0),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50.0,
              width: 50.0,
              color: Colors.grey[400],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 15.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 10.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 25.0,
        );
      },
    );
  }
}
