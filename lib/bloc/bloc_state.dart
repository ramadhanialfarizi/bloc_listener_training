import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  int init;

  Counter({this.init = 0}) : super(init);

  void increment() {
    emit(state + 1);
  }
}
