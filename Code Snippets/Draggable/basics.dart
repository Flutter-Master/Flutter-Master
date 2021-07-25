import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // keeping track of color
  int counter = 0;

  // list of colors
  List<Color> _colors = [
    Colors.red,
    Colors.purple,
    Colors.deepOrange,
    Colors.teal,
  ];

  // upcoming color
  Color _newColor = Colors.red;
  // current color
  Color _currentColor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Draggable<String>(
                data: _newColor.toString(),
                // actual object
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: _newColor,
                ),
                // object when dragging
                feedback: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: _newColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        offset: Offset(0.0, 3.0),
                        color: Colors.black.withOpacity(0.25),
                      )
                    ],
                  ),
                ),
                // place holder object
                childWhenDragging: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.grey[300],
                ),
                // what to do when drag is completed
                onDragCompleted: () {
                  if (counter < 3) {
                    counter++;
                  } else {
                    counter = 0;
                  }
                  setState(() {
                    _newColor = _colors[counter];
                  });
                },
              ),
            ),
          ),
          Expanded(
            // area where object will be dropped
            child: DragTarget<String>(
              builder: (context, accepted, rejected) {
                return Container(
                  color: _currentColor,
                );
              },
              // condition for accepting the object
              onWillAccept: (data) {
                //check if color is red
                if (data == Colors.red.toString()) {
                  return true;
                }
                return false;
              },
              onAccept: (data) {
                setState(() {
                  _currentColor = _newColor;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
