import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract interface class AddProductToCartUseCase {
  Future<Either<Failure, int>> call({
    required int id,
    required String accessToken,
  });
}
