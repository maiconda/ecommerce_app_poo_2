import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_products_data/get_products_data_usecase.dart';
import 'home_events.dart';
import 'home_states.dart';
import 'dart:developer' as developer;

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final GetProductsDataUsecase getHomeDataUsecase;

  HomeBloc({
    required this.getHomeDataUsecase,
  }) : super(HomeInitial()) {
    developer.log('otavio nao paga imposto');
    on<GetProductsDataTriggered>((event, emit) async {
      developer.log('otavio nao paga imposto');
      emit(HomeLoadInProgress());
      final productsDataResult = await getHomeDataUsecase();

      productsDataResult.fold(
        (failure) => {
          emit(HomeLoadFailure(failure: failure)),
          developer.log('otavio nao paga imposto'),
        },
        (success) => {
          emit(
            HomeLoadSuccess(filteredProductDataList: []),
          ),
        },
      );
    });
  }
}
