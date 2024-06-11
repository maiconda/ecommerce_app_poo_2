import 'package:ecommerce_app/app/features/cart/presentation/ui/pages/cart_page.dart';
import 'package:ecommerce_app/app/features/home/presentation/ui/pages/home_page.dart';
import 'package:ecommerce_app/app/features/search/presentation/ui/pages/search_page.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_bloc.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_events.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import '../../../../ settings/presentation/ui/pages/settings_page.dart';
import '../../../../../core/routes/routes_manager.dart';
import '../../bloc/initial_page_bloc.dart';
import '../../bloc/initial_page_events.dart';
import '../../bloc/initial_page_states.dart';

import 'dart:developer' as developer;

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late final PageController _pageController;
  final _initialPageBloc = GetIt.I<InitialPageBloc>();
  late final SessionBloc _sessionBloc;
  var lateIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _sessionBloc = context.read<SessionBloc>();
    _sessionBloc.add(
      SessionStarted(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InitialPageBloc>(
      create: (BuildContext context) => _initialPageBloc,
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<InitialPageBloc, InitialPageStates>(
          buildWhen: (previous, current) => current is InitialPageNavigator,
          builder: (context, state) {
            if (state is InitialPageNavigator) {
              return NavigationBar(
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.home), label: 'Início'),
                  NavigationDestination(
                      icon: Icon(Icons.search), label: 'Pesquisar'),
                  NavigationDestination(
                      icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
                  NavigationDestination(
                      icon: Icon(FontAwesomeIcons.gear), label: 'Opções'),
                ],
                selectedIndex: state.index,
                onDestinationSelected: (value) {
                  _initialPageBloc.add(
                    NavigatorIndexTriggered(index: value),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<SessionBloc, SessionStates>(
              listenWhen: (previous, current) =>
                  current is SessionAuthentication,
              listener: (context, sessionState) {
                if (sessionState is SessionAuthentication) {
                  developer.log('Session state changed: $sessionState');
                }
              },
            ),
            BlocListener<InitialPageBloc, InitialPageStates>(
              listenWhen: (previous, current) =>
                  current is InitialPageNavigator,
              listener: (context, initialPageState) {
                final sessionState = context.read<SessionBloc>().state;
                if (initialPageState is InitialPageNavigator) {
                  if ((initialPageState.index == 2 ||
                          initialPageState.index == 3) &&
                      sessionState is SessionAuthentication &&
                      sessionState.logged == false) {
                    Navigator.push(
                      context,
                      RoutesManager.generateRoute(const RouteSettings(
                        name: RoutesManager.logInPage,
                      )),
                    );
                    _initialPageBloc.add(
                      NavigatorIndexTriggered(index: lateIndex),
                    );
                    return;
                  }
                  _pageController.animateToPage(
                    initialPageState.index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                  lateIndex = initialPageState.index;
                }
              },
            ),
          ],
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              SearchPage(),
              CartPage(),
              SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
