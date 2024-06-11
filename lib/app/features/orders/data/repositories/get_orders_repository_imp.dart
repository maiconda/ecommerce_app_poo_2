import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/formatted_order_entity.dart';
import '../../domain/repositories/get_orders_repository.dart';
import '../data_sources/get_orders/get_cart_remote_datasource.dart';

class GetOrdersRepositoryImp implements GetOrdersRepository {
  final GetOrdersRemoteDatasource getOrdersRemoteDatasource;

  GetOrdersRepositoryImp({
    required this.getOrdersRemoteDatasource,
  });

  @override
  Future<Either<Failure, List<OrderEntity>>> call({
    required String accessToken,
  }) async {
    return getOrdersRemoteDatasource(
      accessToken: accessToken,
    );
  }
}
