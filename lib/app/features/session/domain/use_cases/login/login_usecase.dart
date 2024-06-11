import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/login_entity.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/user_entity.dart';
import '../../../../../core/error/failures.dart';

abstract interface class LoginUseCase {
  Future<Either<Failure, UserEntity>> call({
    required LoginEntity loginEntity,
  });
}
