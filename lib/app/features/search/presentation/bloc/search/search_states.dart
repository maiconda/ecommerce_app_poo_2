import '../../../../../core/entities/category_entity.dart';
import '../../../../../core/error/failures.dart';

sealed class SearchStates {}

final class SearchFormState extends SearchStates {
  final bool valid;

  SearchFormState({this.valid = false});
}

final class SearchCategoriesLoadProgress extends SearchStates {
  SearchCategoriesLoadProgress();
}

final class SearchCategoriesLoadFailure extends SearchStates {
  final Failure failure;

  SearchCategoriesLoadFailure({required this.failure});
}

final class SearchCategoriesLoadSuccess extends SearchStates {
  final List<CategoryEntity> categories;

  SearchCategoriesLoadSuccess({
    required this.categories,
  });
}
