import 'package:bloc/bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
