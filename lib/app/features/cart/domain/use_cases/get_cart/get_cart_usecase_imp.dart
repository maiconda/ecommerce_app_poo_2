import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/features/cart/domain/entities/cart_entity.dart';

import '../../../../../core/error/failures.dart';
import '../../repositories/get_cart_repository.dart';
import 'get_cart_usecase.dart';

class GetCartUseCaseImp implements GetCartUseCase {
  final GetCartRepository getCartRepository;

  GetCartUseCaseImp({required this.getCartRepository});

  @override
  Future<Either<Failure, List<CartEntity>>> call({
    required String accessToken,
  }) async {
    return getCartRepository(
      accessToken: accessToken,
    );
  }
}
