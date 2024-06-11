import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/get_products_data_repository.dart';
import '../../domain/repositories/remove_product_to_cart_repository.dart';
import '../data_sources/get_products_data/get_products_data_remote_datasource.dart';
import '../data_sources/remove_product_to_card/remove_product_to_cart_remote_datasource.dart';

class RemoveProductToCartRepositoryImp
    implements RemoveProductToCartRepository {
  final RemoveProductToCartRemoteDatasource removeProductToCartRemoteDatasource;

  RemoveProductToCartRepositoryImp({
    required this.removeProductToCartRemoteDatasource,
  });

  @override
  Future<Either<Failure, int>> call({
    required int id,
    required String accessToken,
  }) async {
    return removeProductToCartRemoteDatasource(
      id: id,
      accessToken: accessToken,
    );
  }
}
