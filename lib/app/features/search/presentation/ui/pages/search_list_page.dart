import 'package:ecommerce_app/app/features/search/presentation/bloc/search_list/search_list_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/widgets/product_card_widget.dart';
import '../../../domain/enums/search_type_enum.dart';
import '../../bloc/search_list/search_list_bloc.dart';
import '../../bloc/search_list/search_list_events.dart';

class SearchListPage extends StatefulWidget {
  final SearchTypeEnum searchType;
  final int? categoryId;
  final String? semantic;

  const SearchListPage({
    super.key,
    required this.searchType,
    required this.categoryId,
    required this.semantic,
  });

  @override
  State<SearchListPage> createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  final _searchListBloc = GetIt.I<SearchListBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: BlocProvider<SearchListBloc>(
              create: (_) => _searchListBloc..add(
                  SearchListTriggered(
                    semantic: widget.semantic,
                    searchType: widget.searchType,
                    categoryId: widget.categoryId,
                  ),
                ),
              child: BlocBuilder<SearchListBloc, SearchListStates>(
                  buildWhen: (previous, current) => current is SearchListLoadSuccess || current is SearchListLoadFailure,
                  builder: (context, state) {
                    if (state is SearchListLoadProgress) {
                      return const Center(child: Text('carregando'));
                    } else if (state is SearchListLoadSuccess) {
                      return Column(
                        children: [
                          SizedBox(height: 20,),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                              padding: const EdgeInsets.all(6),
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                final product = state.products[index];
                                return ProductCardWidget(
                                  productData: product,
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (state is SearchListLoadFailure) {
                      return const Center(child: Text('Failed to load products'));
                    } else {
                      return Container();
                    }
                  },
                ),
                        ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ),
            ),]
        ),
      ),
    );
  }
}
