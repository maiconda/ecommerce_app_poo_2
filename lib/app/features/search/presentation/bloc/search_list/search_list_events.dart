import '../../../domain/enums/search_type_enum.dart';

sealed class SearchListEvents {}

final class SearchListTriggered extends SearchListEvents {
  final SearchTypeEnum searchType;
  final int? categoryId;
  final String? semantic;

  SearchListTriggered({
    required this.semantic,
    required this.categoryId,
    required this.searchType,
  });
}
