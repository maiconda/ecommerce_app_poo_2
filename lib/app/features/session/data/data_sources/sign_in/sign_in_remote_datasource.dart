import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';

import '../../../../../core/error/failures.dart';

abstract interface class SignInRemoteDatasource {
  Future<Either<Failure, int>> call({
    required SignInEntity signInEntity,
  });
}
