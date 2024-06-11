import 'package:ecommerce_app/app/features/cart/domain/entities/formated_cart_entity.dart';

class OrderEntity {
  final int id;
  final DateTime moment;
  final String orderStatus;
  final List<FormattedCartEntity> orderItems;

  OrderEntity({
    required this.id,
    required this.moment,
    required this.orderStatus,
    required this.orderItems,
  });
}
