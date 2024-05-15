import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../core/error/failures.dart';

sealed class HomeStates {}

final class HomeInitial extends HomeStates {
  HomeInitial();
}

final class HomeLoadInProgress extends HomeStates {
  HomeLoadInProgress();
}

final class HomeLoadFailure extends HomeStates {
  final Failure failure;

  HomeLoadFailure({required this.failure});
}

final class HomeLoadSuccess extends HomeStates {
  final List<ProductDataEntity> productsList;

  HomeLoadSuccess({
    required this.productsList,
  });
}

final class FilteredProductList extends HomeStates {
  final List<ProductDataEntity> filteredProductDataList;

  FilteredProductList({
    required this.filteredProductDataList,
  });
}
