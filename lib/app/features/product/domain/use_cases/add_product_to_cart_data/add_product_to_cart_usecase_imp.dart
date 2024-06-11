import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../repositories/add_product_to_cart_repository.dart';
import 'add_product_to_cart_usecase.dart';

class AddProductToCartUseCaseImp implements AddProductToCartUseCase {
  final AddProductToCartRepository addProductToCartRepository;

  AddProductToCartUseCaseImp({required this.addProductToCartRepository});

  @override
  Future<Either<Failure, int>> call({
    required int id,
    required String accessToken,
  }) async {
    return addProductToCartRepository(
      id: id,
      accessToken: accessToken,
    );
  }
}
