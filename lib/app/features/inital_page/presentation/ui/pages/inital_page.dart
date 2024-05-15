import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';
import 'package:ecommerce_app/app/features/home/presentation/ui/pages/home_page.dart';
import 'package:ecommerce_app/app/features/inital_page/presentation/bloc/initial_page_bloc.dart';
import 'package:ecommerce_app/app/features/inital_page/presentation/bloc/initial_page_events.dart';
import 'package:ecommerce_app/app/features/inital_page/presentation/bloc/initial_page_states.dart';
import 'package:ecommerce_app/app/features/product/presentation/ui/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../widgets/appbar_item_widget.dart';

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
                  NavigationDestination(icon: Icon(Icons.add), label: 'label'),
                  NavigationDestination(icon: Icon(Icons.add), label: 'label'),
                  NavigationDestination(icon: Icon(Icons.add), label: 'label'),
                  NavigationDestination(icon: Icon(Icons.add), label: 'label'),
                ],
                selectedIndex: state.index,
                onDestinationSelected: (value) {
                  _pageController.jumpToPage(value);
                  _initialPageBloc.add(
                    NavigatorIndexTriggered(index: value),
                  );
                },
              ),
              body: PageView(
                controller: _pageController,
                children: const [
                  HomePage(),
                  HomePage(),
                  HomePage(),
                  HomePage(),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
