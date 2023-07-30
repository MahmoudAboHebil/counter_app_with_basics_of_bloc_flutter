import 'dart:async';

import 'package:counter_app_with_basics_of_bloc/business_logic/cubit/internet_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_cubit.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? internetCubitStreamSubscription;
  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    internetCubitStreamSubscription =
        internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected) {
        increment();
      } else if (internetState is InternetDisconnected) {
        decrement();
      }
    });
  }

  void increment() => emit(
        CounterState(
          counterValue: state.counterValue + 1,
          wasIncremented: true,
        ),
      );
  void decrement() => emit(
        CounterState(
          counterValue: state.counterValue - 1,
          wasIncremented: false,
        ),
      );

  @override
  Future<void> close() {
    internetCubitStreamSubscription!.cancel();
    return super.close();
  }
}
