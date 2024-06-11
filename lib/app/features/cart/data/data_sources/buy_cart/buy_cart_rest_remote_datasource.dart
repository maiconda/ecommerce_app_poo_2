import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/features/cart/data/dto/cart_dto.dart';
import 'package:ecommerce_app/app/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/error/failures.dart';
import 'dart:developer' as developer;

import 'buy_cart_remote_datasource.dart';

class BuyCartRestDatasource implements BuyCartRemoteDatasource {
  final Dio dio;

  BuyCartRestDatasource({required this.dio});

  @override
  Future<Either<Failure, int>> call({
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
      Response response = await dio.post(
        '$url/bag/buyAll',
      );
      if (response.statusCode == 200) {
        developer.log('bom');
        return Right(0);
      } else {
        developer.log('Server returned error code: ${response.statusCode}');
        developer.log('ruim 1');
        return Left(ServerFailure());
      }
    } on DioError  catch (e) {
      developer.log('ruim 2');
      return Left(ServerFailure());
    }
  }
}
