import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // when clicked on this button,
        // dialog will appear
        child: RaisedButton(
          child: const Text('Show dialog'),
          onPressed: () {
            // will show dialog on press
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  // you can either create your own dialog
                  // or
                  // use default Material dialog
                  return AlertDialog(
                    // what is the dialog about?
                    title: const Text(
                      'Question',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    // description
                    content: const Text('Do you love Flutter?'),
                    actions: <Widget>[
                      FlatButton(
                        color: Colors.deepPurpleAccent.withOpacity(0.1),
                        splashColor: Colors.deepPurple.withOpacity(0.5),
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                        onPressed: () {
                          //do something
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        splashColor: Colors.deepPurple.withOpacity(0.5),
                        child: Text(
                          'Definitely Yes',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        onPressed: () {
                          //do something
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
