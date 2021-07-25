import 'package:flutter/material.dart';

import 'home_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //creating instance of HomeModel
  final HomeModel _homeModel = HomeModel();

  //closing streams after use
  @override
  void dispose() {
    _homeModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //This button will increment the counter
          FloatingActionButton(
            heroTag: 'add',
            child: Icon(Icons.add),
            onPressed: () {
              //calling the increment counter from HomeModel
              _homeModel.incrementCounter();
            },
          ),
          const SizedBox(
            width: 20.0,
          ),
          //This button will increment the counter
          FloatingActionButton(
            heroTag: 'subtract',
            child: Icon(Icons.remove),
            onPressed: () {
              //calling the decrement counter from HomeModel
              _homeModel.decrementCounter();
            },
          ),
        ],
      ),
      //will rebuild the Text, whenever new data is
      //added to the stream
      body: StreamBuilder<int>(
          //supplying the stream
          stream: _homeModel.integerStream,
          //will show 0 initially
          initialData: 0,
          builder: (context, snapshot) {
            return Center(
              child: Text(
                snapshot.data.toString(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 30.0,
                ),
              ),
            );
          }),
    );
  }
}
