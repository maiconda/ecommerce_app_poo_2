import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/features/session/data/data_sources/sign_in/sign_in_remote_datasource.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/login_entity.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/user_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../../core/error/failures.dart';

import 'dart:developer' as developer;

import '../../dto/user_dto.dart';
import 'login_remote_datasource.dart';

class LoginRestDatasource implements LoginRemoteDatasource {
  final Dio dio;

  LoginRestDatasource({required this.dio});

  @override
  Future<Either<Failure, UserEntity>> call({
    required LoginEntity loginEntity,
  }) async {
    try {
      final String? url = dotenv.env['MODO'];
      if (url == null) {
        developer.log('URL is not defined in .env');
        return Left(ServerFailure());
      }

      Response response = await dio.post(
        '$url/login',
        data: {
          'username': loginEntity.userName,
          'password': loginEntity.password,
        },
      );
      if (response.statusCode == 200) {
        return Right(UserDto.fromJson(response.data));
      } else {
        developer.log('Server returned error code: ${response.statusCode}');
        return Left(ServerFailure());
      }
    } on DioError catch (dioError) {
      developer.log('DioError: ${dioError.message}');
      return Left(ServerFailure());
    } catch (e) {
      developer.log('Error: $e');
      return Left(ServerFailure());
    }
  }
}
