import 'package:flutter/material.dart';

class RouteMonitor extends NavigatorObserver {
  late BuildContext _currentContext;

  BuildContext get currentContext => _currentContext;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    _currentContext = route.navigator!.context;
  }
}
