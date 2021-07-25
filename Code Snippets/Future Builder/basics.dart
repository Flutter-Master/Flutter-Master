import 'package:flutter/material.dart';

class FetchingAPI extends StatefulWidget {
  @override
  _FetchingAPIState createState() => _FetchingAPIState();
}

class _FetchingAPIState extends State<FetchingAPI> {
  // will hold the received data
  Future<String> _receivedData;

  @override
  void initState() {
    super.initState();
    // data will be assigned
    // when the future is completed
    _receivedData = _loadData();
  }

  // dummy simulation of actual
  // network call
  Future<String> _loadData() async {
    // delay of 3 seconds
    await Future.delayed(const Duration(seconds: 3));
    // returning the data
    return 'Precious Data';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // future builder of type string
      body: FutureBuilder<String>(
        future: _receivedData,
        builder: (context, snapshot) {
          // this part will be executed,
          // when snapshot has data
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data),
            );
          }
          // this part will be executed,
          // when there is error in getting
          // data
          else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to get data'),
            );
          }
          // show loading indicator while data
          // is not received
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
