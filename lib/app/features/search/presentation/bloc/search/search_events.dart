sealed class SearchEvents {}

final class SearchFormChanged extends SearchEvents {
  final String form;

  SearchFormChanged({required this.form});
}

final class SearchCategoriesTriggered extends SearchEvents {
  SearchCategoriesTriggered();
}
