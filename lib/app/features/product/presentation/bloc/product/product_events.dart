sealed class ProductEvents {}

final class AddProductToCartTriggered extends ProductEvents {
  final int id;
  final String accessToken;

  AddProductToCartTriggered({
    required this.id,
    required this.accessToken,
  });
}

final class RemoveProductToCartTriggered extends ProductEvents {
  final int id;
  final String accessToken;

  RemoveProductToCartTriggered({
    required this.id,
    required this.accessToken,
  });
}
