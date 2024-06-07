import 'package:ecommerce_app/app/core/widgets/product_card_widget.dart';
import 'package:ecommerce_app/app/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_app/app/features/home/presentation/bloc/home_events.dart';
import 'package:ecommerce_app/app/features/home/presentation/bloc/home_states.dart';
import 'package:ecommerce_app/app/features/initial_page/presentation/bloc/initial_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import '../../../../initial_page/presentation/bloc/initial_page_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final _homeBloc = GetIt.I<HomeBloc>();
  late final InitialPageBloc _initialPageBloc;

  @override
  void initState() {
    _initialPageBloc = context.read<InitialPageBloc>();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<HomeBloc>(
      create: (_) => _homeBloc
        ..add(
          GetProductsDataTriggered(),
        ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 75,
            actions: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _initialPageBloc.add(
                      NavigatorIndexTriggered(index: 1),
                    );
                  },
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 15, right: 13),
                          child: const Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                        const Text('Buscar no ECommerce App')
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _initialPageBloc.add(
                    NavigatorIndexTriggered(index: 2),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Icon(
                    FontAwesomeIcons.cartShopping,
                    size: 19,
                  ),
                ),
              )
            ],
          ),
          body: BlocBuilder<HomeBloc, HomeStates>(
            builder: (context, state) {
              if (state is HomeLoadInProgress) {
                return const Center(child: Text('carregando'));
              } else if (state is HomeLoadSuccess) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  padding: const EdgeInsets.all(6),
                  itemCount: state.productsList.length,
                  itemBuilder: (context, index) {
                    final product = state.productsList[index];
                    return ProductCardWidget(
                      productData: product,
                    );
                  },
                );
              } else if (state is HomeLoadFailure) {
                return const Center(child: Text('Failed to load products'));
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
