import 'package:connectivity_plus/connectivity_plus.dart';

import '../../constants/enums.dart';

class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
