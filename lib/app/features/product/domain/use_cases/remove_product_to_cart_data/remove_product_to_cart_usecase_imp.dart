import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../repositories/add_product_to_cart_repository.dart';
import '../../repositories/remove_product_to_cart_repository.dart';
import 'remove_product_to_cart_usecase.dart';

class RemoveProductToCartUseCaseImp implements RemoveProductToCartUseCase {
  final RemoveProductToCartRepository removeProductToCartRepository;

  RemoveProductToCartUseCaseImp({required this.removeProductToCartRepository});

  @override
  Future<Either<Failure, int>> call({
    required int id,
    required String accessToken,
  }) async {
    return removeProductToCartRepository(
      id: id,
      accessToken: accessToken,
    );
  }
}
