import 'package:ecommerce_app/app/features/search/presentation/bloc/search/search_events.dart';
import 'package:ecommerce_app/app/features/search/presentation/bloc/search/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/get_categories/get_categories_usecase.dart';

class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  final GetCategoriesUseCase getCategoriesUseCase;

  SearchBloc({required this.getCategoriesUseCase})
      : super(SearchFormState(valid: false)) {
    var form = '';

    on<SearchFormChanged>((event, emit) {
      form = event.form;
      if (form.isNotEmpty) {
        emit(SearchFormState(valid: true));
      } else {
        emit(SearchFormState(valid: false));
      }
    });

    on<SearchCategoriesTriggered>((event, emit) async {
      emit(SearchCategoriesLoadProgress());
      final getCategoriesResult = await getCategoriesUseCase();

      getCategoriesResult.fold(
        (failure) => {
          emit(SearchCategoriesLoadFailure(failure: failure)),
        },
        (success) => {
          emit(
            SearchCategoriesLoadSuccess(
              categories: success,
            ),
          ),
        },
      );
    });
  }
}
