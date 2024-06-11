
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/sign_in/sign_in_repository.dart';
import '../data_sources/sign_in/sign_in_remote_datasource.dart';

class SignInRepositoryImp implements SignInRepository {
  final SignInRemoteDatasource signInRemoteDatasource;

  SignInRepositoryImp({
    required this.signInRemoteDatasource,
  });

  @override
  Future<Either<Failure, int>> call({
    required SignInEntity signInEntity,
}) async {
    return signInRemoteDatasource(
      signInEntity: signInEntity,
    );
  }
}
