import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../../core/error/failures.dart';

sealed class SearchListStates {}

final class SearchListInitial extends SearchListStates {
  SearchListInitial();
}

final class SearchListLoadProgress extends SearchListStates {
  SearchListLoadProgress();
}

final class SearchListLoadFailure extends SearchListStates {
  final Failure failure;

  SearchListLoadFailure({required this.failure});
}

final class SearchListLoadSuccess extends SearchListStates {
  final List<ProductDataEntity> products;

  SearchListLoadSuccess({
    required this.products,
  });
}
