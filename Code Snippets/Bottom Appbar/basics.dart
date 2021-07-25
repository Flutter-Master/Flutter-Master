import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // adding a floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          //TODO:
        },
      ),
      // setting location of
      // floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // adding bottom app bar
      bottomNavigationBar: BottomAppBar(
        // defining shape
        shape: CircularNotchedRectangle(),
        color: Colors.deepPurple,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  //TODO:
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                //TODO:
              },
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
