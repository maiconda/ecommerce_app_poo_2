import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../entitites/sign_in_entity.dart';
import '../../repositories/admin_sign_in/admin_sign_in_repository.dart';
import 'admin_sign_in_usecase.dart';

class AdminSignInUseCaseImp implements AdminSignInUseCase {
  final AdminSignInRepository adminSignInRepository;

  AdminSignInUseCaseImp({required this.adminSignInRepository});

  @override
  Future<Either<Failure, int>> call({
    required SignInEntity signInEntity,
    required String accessToken,
  }) async {
    return adminSignInRepository(
      signInEntity: signInEntity,
      accessToken: accessToken
    );
  }
}
