import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/formatted_order_entity.dart';

abstract interface class GetOrdersRemoteDatasource {
  Future<Either<Failure, List<OrderEntity>>> call({
    required String accessToken,
});
}
