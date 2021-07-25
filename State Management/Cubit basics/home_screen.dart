import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

import 'counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //calling the increment method
          //on CounterCubit
          CubitProvider.of<CounterCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        //CubitBuilder will rebuild
        //the widget tree below it,
        //whenever a new state is emitted
        //from counter cubit
        child: CubitBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(
              state.toString(),
              style: TextStyle(
                fontSize: 30.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
