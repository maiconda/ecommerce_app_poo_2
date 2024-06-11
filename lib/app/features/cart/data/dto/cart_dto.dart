import 'package:ecommerce_app/app/features/cart/domain/entities/cart_entity.dart';

import '../../../product/data/dto/product_data_dto.dart';

class CartDto extends CartEntity {
  CartDto._({
    required super.id,
    required super.quantity,
    required super.price,
    required super.product,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) {
    return CartDto._(
      id: json['id'],
      price: json['price'],
      product: ProductDataDto.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
}
