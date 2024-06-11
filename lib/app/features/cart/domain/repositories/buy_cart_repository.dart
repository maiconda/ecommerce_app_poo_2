import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract interface class BuyCartRepository{
  Future<Either<Failure, int>> call({
    required String accessToken,
});
}
