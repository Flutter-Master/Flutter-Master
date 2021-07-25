import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

import 'counter_cubit.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      //removing debug banner
      debugShowCheckedModeBanner: false,
      //will provide CounterCubit
      //to the widget tree below it
      home: CubitProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: HomeScreen(),
      ),
    );
  }
}
