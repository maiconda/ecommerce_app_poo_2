import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/formatted_order_entity.dart';

abstract interface class GetOrdersUseCase {
  Future<Either<Failure, List<OrderEntity>>> call({
    required String accessToken,
  });
}
