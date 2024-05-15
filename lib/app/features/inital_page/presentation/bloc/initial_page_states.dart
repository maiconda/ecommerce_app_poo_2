import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../core/error/failures.dart';

sealed class InitialPageStates {}

final class InitialPageNavigator extends InitialPageStates {
  final int index;

  InitialPageNavigator({
    required this.index,
  });
}
