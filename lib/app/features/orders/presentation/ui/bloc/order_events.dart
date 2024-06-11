import '../../../domain/entities/formatted_order_entity.dart';

sealed class OrdersEvents {}

final class GetOrdersTriggered extends OrdersEvents {
  final String accessToken;

  GetOrdersTriggered(this.accessToken);
}

final class OrdersFormattedTriggered extends OrdersEvents {
  final List<OrderEntity> orders;

  OrdersFormattedTriggered({
    required this.orders,
  });
}