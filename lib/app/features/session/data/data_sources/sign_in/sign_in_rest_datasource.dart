import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/features/session/data/data_sources/sign_in/sign_in_remote_datasource.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../../core/error/failures.dart';

import 'dart:developer' as developer;

class SignInRestDatasource implements SignInRemoteDatasource {
  final Dio dio;

  SignInRestDatasource({required this.dio});

  @override
  Future<Either<Failure, int>> call({
    required SignInEntity signInEntity,
  }) async {
    try {
      final String? url = dotenv.env['MODO'];
      if (url == null) {
        developer.log('URL is not defined in .env');
        return Left(ServerFailure());
      }

      Response response = await dio.post(
        '$url/users',
        data: {
          'name': signInEntity.name,
          'email': signInEntity.email,
          'phone': signInEntity.phone,
          'username': signInEntity.userName,
          'password': signInEntity.password,
          'img': signInEntity.imageUrl
        },
      );

      developer.log(signInEntity.imageUrl);

      developer.log('URL: $url');
      if (response.statusCode == 200) {
        developer.log('Success: ${response.data}');
        return Right(response.statusCode ?? 200);
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
