import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInit extends CounterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CounterUpdate extends CounterState {
  //send value for UI
  final int counter;
  const CounterUpdate(this.counter);

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}
