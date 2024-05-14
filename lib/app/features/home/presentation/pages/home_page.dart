import 'package:ecommerce_app/app/core/widgets/product_card_widget.dart';
import 'package:ecommerce_app/app/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_app/app/features/home/presentation/bloc/home_events.dart';
import 'package:ecommerce_app/app/features/home/presentation/bloc/home_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = GetIt.I<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => _homeBloc
        ..add(
          GetProductsDataTriggered(),
        ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: const [],
            title: const Text(
              'teste',
            ),
          ),
          body: BlocBuilder<HomeBloc, HomeStates>(
            builder: (context, state) {
              if (state is HomeLoadInProgress) {
                return Center(child: Text('carregando'));
              } else if (state is HomeLoadSuccess) {
                return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  padding: const EdgeInsets.all(5),
                  children: [
                  ProductCardWidget(),
                  ProductCardWidget(),
                  ProductCardWidget(),
                  ProductCardWidget(),
                  ],
                );
              } else if (state is HomeLoadFailure) {
                return Center(child: Text('Failed to load products'));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
