import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/error/failures.dart';
import 'dart:developer' as developer;

import '../../../domain/entities/formatted_order_entity.dart';
import 'get_cart_remote_datasource.dart';

class GetOrdersRestDatasource implements GetOrdersRemoteDatasource {
  final Dio dio;

  GetOrdersRestDatasource({required this.dio});

  @override
  Future<Either<Failure, List<OrderEntity>>> call({
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
        '$url/bag',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        // List<OrdersEntity> products = data
        //     .map((product) => OrdersDto.fromJson(product))
        //     .toList();
        developer.log(data.toString());
        return Right([]);
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
