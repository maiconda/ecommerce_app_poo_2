import 'package:ecommerce_app/app/features/about/presentation/ui/pages/about_page.dart';
import 'package:ecommerce_app/app/features/search/domain/enums/search_type_enum.dart';
import 'package:ecommerce_app/app/features/search/presentation/ui/pages/search_list_page.dart';
import 'package:ecommerce_app/app/features/session/presentation/ui/pages/login_page.dart';
import 'package:ecommerce_app/app/features/session/presentation/ui/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/ui/pages/home_page.dart';
import '../../features/product/presentation/ui/pages/product_page.dart';
import '../../features/session/presentation/ui/pages/admin_sign_in_page.dart';
import '../entities/product_data_entity.dart';
import '../utils/responsiveness.dart';
import '../widgets/empty_widget.dart';

class RoutesManager {
  static const String homePage = 'home';
  static const String productPage = 'product_page';
  static const String signInPage = 'sign_in_page';
  static const String logInPage = 'log_in_page';
  static const String aboutPage = 'about_page';
  static const String adminSignInPage = 'admin_sign_in_page';
  static const String searchListPage = 'search_list_page';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case searchListPage:
        final argumentsList = routeSettings.arguments! as List<dynamic>;
        return MaterialPageRoute(
          builder: (context) => Responsiveness.returnResponsiveWidget(
            widget: SearchListPage(
              searchType: argumentsList[0] as SearchTypeEnum,
              categoryId: argumentsList[1] as int?,
              semantic: argumentsList[2] as String?,
            ),
            context: context,
          ),
        );
      case adminSignInPage:
        return MaterialPageRoute(
          builder: (context) => Responsiveness.returnResponsiveWidget(
            widget: AdminSignInPage(
                accessToken: routeSettings.arguments! as String),
            context: context,
          ),
        );
      case aboutPage:
        return MaterialPageRoute(
          builder: (context) => Responsiveness.returnResponsiveWidget(
            widget: const AboutPage(),
            context: context,
          ),
        );
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
