
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/admin_sign_in/admin_sign_in_repository.dart';
import '../../domain/repositories/sign_in/sign_in_repository.dart';
import '../data_sources/admin_sign_in/admin_sign_in_remote_datasource.dart';
import '../data_sources/sign_in/sign_in_remote_datasource.dart';

class AdminSignInRepositoryImp implements AdminSignInRepository {
  final AdminSignInRemoteDatasource adminSignInRemoteDatasource;

  AdminSignInRepositoryImp({
    required this.adminSignInRemoteDatasource,
  });

  @override
  Future<Either<Failure, int>> call({
    required SignInEntity signInEntity,
    required String accessToken,
}) async {
    return adminSignInRemoteDatasource(
      signInEntity: signInEntity,
      accessToken: accessToken,
    );
  }
}
