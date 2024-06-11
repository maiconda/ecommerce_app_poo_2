import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../../core/error/failures.dart';
import 'add_product_to_cart_remote_datasource.dart';
import 'dart:developer' as developer;

class AddProductToCartRestDatasource implements AddProductToCartRemoteDatasource {
  final Dio dio;

  AddProductToCartRestDatasource({required this.dio});

  @override
  Future<Either<Failure, int>> call({
    required int id,
    required String accessToken,
}) async {
    final String? url = dotenv.env['MODO'];
    if (url == null) {
      developer.log('URL is not defined in .env');
      return Left(ServerFailure());
    }
    try {
      dio.options.headers['Authorization'] = 'Bearer $accessToken';
      Response response = await dio.post(
        '$url/bag/to_bag/$id',
        data: {
          'quantity': 1,
        },
      );
      if (response.statusCode == 200) {
        developer.log('boa');
        return const Right(200);
      } else {
        developer.log('erro 1');
        return Left(ServerFailure());
      }
    } catch (e) {
      developer.log('erro 2');
      return Left(ServerFailure());
    }
  }
}
