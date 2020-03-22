import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];

}

class InitialCounterState extends CounterState {
}
