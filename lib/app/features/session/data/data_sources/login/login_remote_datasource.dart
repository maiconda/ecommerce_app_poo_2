import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/login_entity.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/user_entity.dart';

import '../../../../../core/error/failures.dart';

abstract interface class LoginRemoteDatasource {
  Future<Either<Failure, UserEntity>> call({
    required LoginEntity loginEntity,
  });
}
