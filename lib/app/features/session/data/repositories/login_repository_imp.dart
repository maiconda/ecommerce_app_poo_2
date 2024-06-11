import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/login_entity.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/user_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/login/login_repository.dart';
import '../../domain/repositories/sign_in/sign_in_repository.dart';
import '../data_sources/login/login_remote_datasource.dart';
import '../data_sources/sign_in/sign_in_remote_datasource.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginRemoteDatasource loginRemoteDatasource;

  LoginRepositoryImp({
    required this.loginRemoteDatasource,
  });

  @override
  Future<Either<Failure, UserEntity>> call({
    required LoginEntity loginEntity,
  }) async {
    return loginRemoteDatasource(
      loginEntity: loginEntity,
    );
  }
}
