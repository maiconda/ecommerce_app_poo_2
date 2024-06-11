import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../repositories/buy_cart_repository.dart';
import 'buy_cart.usecase.dart';

class BuyCartUseCaseImp implements BuyCartUseCase {
  final BuyCartRepository buyCartRepository;

  BuyCartUseCaseImp({required this.buyCartRepository});

  @override
  Future<Either<Failure, int>> call({
    required String accessToken,
}) async {
    return buyCartRepository(accessToken: accessToken);
  }
}