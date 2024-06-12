import 'package:ecommerce_app/app/core/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/routes/routes_manager.dart';
import '../../../domain/enums/search_type_enum.dart';
import '../../bloc/search/search_bloc.dart';
import '../../bloc/search/search_events.dart';
import '../../bloc/search/search_states.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBloc = GetIt.I<SearchBloc>();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => _searchBloc
        ..add(
          SearchCategoriesTriggered(),
        ),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<SearchBloc, SearchStates>(
                  buildWhen: (previous, current) => current is SearchFormState,
                  builder: (context, state) {
                    if (state is SearchFormState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: const Text(
                              'O que você está procurando?',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 18,
                                          right: 15,
                                        ),
                                        child: const Icon(
                                          FontAwesomeIcons.magnifyingGlass,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: _searchController,
                                          onChanged: (value) {
                                            _searchBloc.add(
                                              SearchFormChanged(form: value),
                                            );
                                          },
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            hintStyle: TextStyle(fontSize: 15),
                                            hintText: 'Digite aqui',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: const Icon(
                                          FontAwesomeIcons.xmark,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 47,
                                margin: const EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                  onPressed: state.valid
                                      ? () {
                                          Navigator.push(
                                            context,
                                            RoutesManager.generateRoute(
                                              RouteSettings(
                                                name: RoutesManager
                                                    .searchListPage,
                                                arguments: [
                                                  SearchTypeEnum.semantic,
                                                  null,
                                                  _searchController.value.text,
                                                  null
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      : null,
                                  child: const Text('Buscar'),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
                BlocBuilder<SearchBloc, SearchStates>(
                  buildWhen: (previous, current) =>
                      current is SearchCategoriesLoadSuccess,
                  builder: (context, state) {
                    if (state is SearchCategoriesLoadSuccess) {
                      return Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.black.withOpacity(0.7),
                              margin:
                                  const EdgeInsets.only(bottom: 15, top: 20),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Text(
                                'Principais Categorias',
                                style: GoogleFonts.montserrat().copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: state.categories.length,
                                itemBuilder: (context, index) {
                                  return CategoryWidget(
                                    categoryEntity: state.categories[index],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
