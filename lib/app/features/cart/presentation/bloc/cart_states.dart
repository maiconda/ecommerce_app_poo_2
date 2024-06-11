import 'package:ecommerce_app/app/features/cart/domain/entities/cart_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/formated_cart_entity.dart';

sealed class CartStates {}

final class CartInitial extends CartStates {
  CartInitial();
}

final class CartLoadProgress extends CartStates {
  CartLoadProgress();
}

final class CartLoadFailure extends CartStates {
  final Failure failure;

  CartLoadFailure({required this.failure});
}

final class BuyCartLoadSuccess extends CartStates {
  BuyCartLoadSuccess();
}

final class BuyCartLoadProgress extends CartStates {
  BuyCartLoadProgress();
}

final class BuyCartLoadFailure extends CartStates {
  final Failure failure;

  BuyCartLoadFailure({required this.failure});
}


final class CartFormatted extends CartStates {
  final List<FormattedCartEntity> formattedCart;

  CartFormatted({required this.formattedCart});
}

final class CartLoadSuccess extends CartStates {
  final List<CartEntity> cartProducts;

  CartLoadSuccess({
    required this.cartProducts,
  });
}
