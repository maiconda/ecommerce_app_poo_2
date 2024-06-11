import 'package:ecommerce_app/app/features/orders/domain/entities/formatted_order_entity.dart';

import '../../../../../core/error/failures.dart';

sealed class OrdersStates {}

final class OrdersInitial extends OrdersStates {
  OrdersInitial();
}

final class OrdersLoadProgress extends OrdersStates {
  OrdersLoadProgress();
}

final class OrdersLoadFailure extends OrdersStates {
  final Failure failure;

  OrdersLoadFailure({required this.failure});
}

final class OrdersFormatted extends OrdersStates {
  final List<OrdersFormatted> formattedOrders;

  OrdersFormatted({required this.formattedOrders});
}

final class OrdersLoadSuccess extends OrdersStates {
  final List<OrderEntity> orderProducts;

  OrdersLoadSuccess({
    required this.orderProducts,
  });
}
