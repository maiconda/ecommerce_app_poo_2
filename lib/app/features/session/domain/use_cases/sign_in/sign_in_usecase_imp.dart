import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';
import 'package:ecommerce_app/app/features/session/domain/use_cases/sign_in/sign_in_usecase.dart';

import '../../../../../core/error/failures.dart';
import '../../repositories/sign_in/sign_in_repository.dart';

class SignInUseCaseImp implements SignInUseCase {
  final SignInRepository signInRepository;

  SignInUseCaseImp({required this.signInRepository});

  @override
  Future<Either<Failure, int>> call({
    required SignInEntity signInEntity,
  }) async {
    return signInRepository(
      signInEntity: signInEntity,
    );
  }
}
