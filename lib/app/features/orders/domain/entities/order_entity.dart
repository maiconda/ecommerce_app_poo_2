import '../../../cart/domain/entities/cart_entity.dart';

class OrderEntity {
  final int id;
  final DateTime moment;
  final String orderStatus;
  final List<CartEntity> orderItems;

  OrderEntity({
    required this.id,
    required this.moment,
    required this.orderStatus,
    required this.orderItems,
  });
}
