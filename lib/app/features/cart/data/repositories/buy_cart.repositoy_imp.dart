import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/buy_cart_repository.dart';
import '../data_sources/buy_cart/buy_cart_remote_datasource.dart';

class BuyCartRepositoryImp implements BuyCartRepository {
  final BuyCartRemoteDatasource buyCartRemoteDatasource;

  BuyCartRepositoryImp({
    required this.buyCartRemoteDatasource,
  });

  @override
  Future<Either<Failure, int>> call({
    required String accessToken,
}) async {
    return buyCartRemoteDatasource(accessToken: accessToken);
  }
}
