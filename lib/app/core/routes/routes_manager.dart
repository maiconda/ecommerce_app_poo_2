import 'package:flutter/material.dart';

import '../../features/home/presentation/ui/pages/home_page.dart';
import '../../features/product/presentation/ui/pages/product_page.dart';
import '../entities/product_data_entity.dart';
import '../utils/responsivness.dart';
import '../widgets/empty_widget.dart';

class RoutesManager {
  static const String homePage = 'home';
  static const String productPage = 'product_page';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => Responsiveness.returnResponsiveWidget(
            widget: const HomePage(),
            context: context,
          ),
        );
      case productPage:
        return MaterialPageRoute(
          builder: (context) => Responsiveness.returnResponsiveWidget(
            widget: ProductPage(
              productData: routeSettings.arguments! as ProductDataEntity,
            ),
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
