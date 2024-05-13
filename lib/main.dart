
import 'package:ecommerce_app/app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'app/core/inject/global_bloc_provider_helper.dart';
import 'app/core/inject/inject.dart';
import 'app/core/routes/route_monitor.dart';
import 'app/core/routes/routes_manager.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

Future<void> main() async {
  await dotenv.load();
  await Inject.init();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.blue,
    ),
  );

  runApp(
    GlobalBlocProviderHelper.provide(
      child: const ECommerceApp(),
    ),
  );
}

class ECommerceApp extends StatefulWidget {
  const ECommerceApp({super.key});

  @override
  State<ECommerceApp> createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ECommerceApp',
        navigatorKey: _navigatorKey,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 600, name: MOBILE),
            const Breakpoint(start: 601, end: 1000, name: TABLET),
          ],
        ),
        navigatorObservers: [GetIt.I<RouteMonitor>()],
        onGenerateRoute: RoutesManager.generateRoute,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
    );
  }
}
