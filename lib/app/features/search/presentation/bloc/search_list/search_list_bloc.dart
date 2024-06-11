import 'package:ecommerce_app/app/features/search/presentation/bloc/search_list/search_list_events.dart';
import 'package:ecommerce_app/app/features/search/presentation/bloc/search_list/search_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/get_search/get_search_usecase.dart';
import 'dart:developer' as developer;

class SearchListBloc extends Bloc<SearchListEvents, SearchListStates> {
  final GetSearchUseCase getSearchUseCase;

  SearchListBloc({required this.getSearchUseCase})
      : super(SearchListInitial()) {
    on<SearchListTriggered>((event, emit) async {
      emit(SearchListLoadProgress());
      final getSearchResult = await getSearchUseCase(
        categoryId: event.categoryId,
        searchType: event.searchType,
        semantic: event.semantic,
      );

      getSearchResult.fold(
        (failure) => {
          emit(SearchListLoadFailure(failure: failure)),
        },
        (success) => {
          emit(
            SearchListLoadSuccess(
              products: success,
            ),
          ),
        },
      );
    });
  }
}
