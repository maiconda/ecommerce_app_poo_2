import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/formatted_order_entity.dart';
import '../../repositories/get_orders_repository.dart';
import 'get_orders_usecase.dart';

class GetOrdersUseCaseImp implements GetOrdersUseCase {
  final GetOrdersRepository getOrdersRepository;

  GetOrdersUseCaseImp({required this.getOrdersRepository});

  @override
  Future<Either<Failure, List<OrderEntity>>> call({
    required String accessToken,
  }) async {
    return getOrdersRepository(
      accessToken: accessToken,
    );
  }
}
