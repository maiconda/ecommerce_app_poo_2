import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract interface class BuyCartUseCase {
  Future<Either<Failure, int>> call({
    required String accessToken,
});
}
