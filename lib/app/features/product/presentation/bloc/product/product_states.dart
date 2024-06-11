import '../../../../../core/entities/category_entity.dart';
import '../../../../../core/error/failures.dart';

sealed class ProductStates {}

final class ProductInitial extends ProductStates {
  ProductInitial();
}

final class AddProductToCartLoadProgress extends ProductStates {
  AddProductToCartLoadProgress();
}

final class AddProductToCartLoadFailure extends ProductStates {
  final Failure failure;

  AddProductToCartLoadFailure({required this.failure});
}

final class AddProductToCartLoadSuccess extends ProductStates {
  AddProductToCartLoadSuccess();
}

final class RemoveProductToCartLoadProgress extends ProductStates {
  RemoveProductToCartLoadProgress();
}

final class RemoveProductToCartLoadFailure extends ProductStates {
  final Failure failure;

  RemoveProductToCartLoadFailure({required this.failure});
}

final class RemoveProductToCartLoadSuccess extends ProductStates {
  RemoveProductToCartLoadSuccess();
}