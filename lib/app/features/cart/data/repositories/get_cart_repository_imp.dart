import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';
import 'package:ecommerce_app/app/features/cart/domain/entities/cart_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/get_cart_repository.dart';
import '../data_sources/get_cart/get_cart_remote_datasource.dart';

class GetCartRepositoryImp implements GetCartRepository {
  final GetCartRemoteDatasource getCartRemoteDatasource;

  GetCartRepositoryImp({
    required this.getCartRemoteDatasource,
  });

  @override
  Future<Either<Failure, List<CartEntity>>> call({
    required String accessToken,
}) async {
    return getCartRemoteDatasource(
      accessToken: accessToken,
    );
  }
}
