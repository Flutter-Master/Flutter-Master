import 'package:cubit/cubit.dart';

/// This class holds all the business
/// logic for the [HomeScreen]
class CounterCubit extends Cubit<int> {
  //will emit 0 initially
  CounterCubit() : super(0);

  /// will increment the counter
  /// and push it
  void increment() {
    emit(state + 1);
  }

  //keeps record of the transactions
  @override
  void onTransition(Transition<int> transition) {
    //prints the transaction to the console
    print(transition);
    super.onTransition(transition);
  }
}
