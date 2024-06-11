import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/login_entity.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';
import 'package:ecommerce_app/app/features/session/domain/use_cases/sign_in/sign_in_usecase.dart';

import '../../../../../core/error/failures.dart';
import '../../entitites/user_entity.dart';
import '../../repositories/login/login_repository.dart';
import '../../repositories/sign_in/sign_in_repository.dart';
import 'login_usecase.dart';

class LoginUseCaseImp implements LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCaseImp({required this.loginRepository});

  @override
  Future<Either<Failure, UserEntity>> call({
    required LoginEntity loginEntity,
  }) async {
    return loginRepository(
      loginEntity: loginEntity,
    );
  }
}
