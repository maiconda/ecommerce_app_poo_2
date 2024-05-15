import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/domain/use_cases/get_products_data/get_products_data_usecase.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final GetProductsDataUsecase getProductsDataUsecase;

  HomeBloc({
    required this.getProductsDataUsecase,
  }) : super(HomeInitial()) {
    on<GetProductsDataTriggered>((event, emit) async {
      emit(HomeLoadInProgress());
      final productsDataResult = await getProductsDataUsecase();

      productsDataResult.fold(
        (failure) => {
          emit(HomeLoadFailure(failure: failure)),
        },
        (success) => {
          emit(
            HomeLoadSuccess(productsList: success),
          ),
        },
      );
    });
  }
}
