import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

class CartEntity {
  final int id;
  final int quantity;
  final double price;
  final ProductDataEntity product;

  CartEntity({required this.id, required this.quantity, required this.price, required this.product});
}