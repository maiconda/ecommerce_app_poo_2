import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';

import 'connection_service.dart';

class ConnectionPlusService implements ConnectionService {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  bool _connected = true;

  @override
  void listenConectivity({
    required Function({required bool connected}) callback,
  }) {
    final _connectivity = Connectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
          final auxConnected = _isConnected(connectivityResult: event);
          if (_connected != auxConnected) {
            _connected = auxConnected;
            developer.log('CONNECTION STATUS HAS CHANGED $_connected');

            callback(connected: _connected);
          }
        });
  }

  bool _isConnected({required List<ConnectivityResult> connectivityResult}) {
    return connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
  }

  @override
  Future<bool> returnCurrentStatus() async {
    return _connected = _isConnected(
      connectivityResult: await _connectivity.checkConnectivity(),
    );
  }
}
