import '../../domain/entities/cart_entity.dart';

sealed class CartEvents {}

final class CartTriggered extends CartEvents {
  final String accessToken;

  CartTriggered(this.accessToken);
}

final class CartFormatTriggered extends CartEvents {
  final List<CartEntity> cartProducts;

  CartFormatTriggered({
    required this.cartProducts,
  });
}

final class BuyCartTriggered extends CartEvents {
  final String accessToken;

  BuyCartTriggered({
    required this.accessToken,
  });
}
