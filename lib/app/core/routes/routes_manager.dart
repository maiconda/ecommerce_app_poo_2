import 'package:ecommerce_app/app/features/session/presentation/ui/pages/login_page.dart';
import 'package:ecommerce_app/app/features/session/presentation/ui/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/ui/pages/home_page.dart';
import '../../features/product/presentation/ui/pages/product_page.dart';
import '../entities/product_data_entity.dart';
import '../utils/responsiveness.dart';
import '../widgets/empty_widget.dart';

class RoutesManager {
  static const String homePage = 'home';
  static const String productPage = 'product_page';
  static const String signInPage = 'sign_in_page';
  static const String logInPage = 'log_in_page';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case logInPage:
        return MaterialPageRoute(
          builder: (context) => Responsiveness.returnResponsiveWidget(
            widget: const LoginPage(),
            context: context,
          ),
        );
      case signInPage:
        return MaterialPageRoute(
          builder: (context) => Responsiveness.returnResponsiveWidget(
            widget: const SignInPage(),
            context: context,
          ),
        );
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
