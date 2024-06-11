import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/features/cart/data/dto/cart_dto.dart';
import 'package:ecommerce_app/app/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/error/failures.dart';
import 'get_cart_remote_datasource.dart';
import 'dart:developer' as developer;

class GetCartRestDatasource implements GetCartRemoteDatasource {
  final Dio dio;

  GetCartRestDatasource({required this.dio});

  @override
  Future<Either<Failure, List<CartEntity>>> call({
    required String accessToken,
  }) async {
    final String? url = dotenv.env['MODO'];
    if (url == null) {
      developer.log('URL is not defined in .env');
      return Left(ServerFailure());
    }
    try {
      final String? url = dotenv.env['MODO'];
      if (url == null) {
        developer.log('URL is not defined in .env');
        return Left(ServerFailure());
      }

      dio.options.headers['Authorization'] = 'Bearer ${accessToken}';
      developer.log(accessToken);

      Response response = await dio.get(
        '$url/bag/user_bags',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<CartEntity> products = data
            .map((product) => CartDto.fromJson(product))
            .toList();
        return Right(products);
      } else {
        developer.log('ruim 1');
        developer.log('Server returned error code: ${response.statusCode}');
        return Left(ServerFailure());
      }
    } on DioError  catch (e) {
      developer.log('ruim 2');
      return Left(ServerFailure());
    }
  }
}
