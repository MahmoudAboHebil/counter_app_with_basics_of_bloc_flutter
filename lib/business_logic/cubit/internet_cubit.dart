import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_app_with_basics_of_bloc/business_logic/cubit/internet_state.dart';
import 'package:counter_app_with_basics_of_bloc/constants/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;
  InternetCubit({required this.connectivity}) : super(InternetLoading());

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
