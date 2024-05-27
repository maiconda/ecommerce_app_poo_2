import 'package:ecommerce_app/app/features/%20settings/presentation/ui/pages/settings_page.dart';
import 'package:ecommerce_app/app/features/cart/presentation/ui/pages/cart_page.dart';
import 'package:ecommerce_app/app/features/home/presentation/ui/pages/home_page.dart';
import 'package:ecommerce_app/app/features/search/presentation/ui/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/initial_page_bloc.dart';
import '../../bloc/initial_page_events.dart';
import '../../bloc/initial_page_states.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final PageController _pageController = PageController();
  final _initialPageBloc = GetIt.I<InitialPageBloc>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InitialPageBloc>(
      create: (BuildContext context) => _initialPageBloc..add(
        NavigatorIndexTriggered(index: 0),
      ),
      child: BlocBuilder<InitialPageBloc, InitialPageStates>(
        buildWhen: (previous, current) => current is InitialPageNavigator,
        builder: (context, state) {
          if(state is InitialPageNavigator){
            return Scaffold(
              bottomNavigationBar: NavigationBar(

                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Início'),
                  NavigationDestination(icon: Icon(Icons.search), label: 'Pesquisar'),
                  NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
                  NavigationDestination(icon: Icon(FontAwesomeIcons.gear), label: 'Opções'),
                ],
                selectedIndex: state.index,
                onDestinationSelected: (value) {
                  _initialPageBloc.add(
                    NavigatorIndexTriggered(index: value),
                  );
                  _pageController.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
              body: PageView(
                controller: _pageController,
                children: const [
                  HomePage(),
                  SearchPage(),
                  CartPage(),
                  SettingsPage(),
                ],
                onPageChanged: (value) {
                  _initialPageBloc.add(
                    NavigatorIndexTriggered(index: value),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
