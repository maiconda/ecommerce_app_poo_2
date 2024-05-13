import 'package:ecommerce_app/app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../utils/responsivness.dart';
import '../widgets/empty_widget.dart';

class RoutesManager {
  static const String homePage = 'home';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => Responsiveness.returnResponsiveWidget(
            widget: HomePage(),
            context: context,
          ),
        );
    }

    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Column(
          children: [
            Center(child: EmptyWidget()),
          ],
        ),
      ),
    );
  }
}
