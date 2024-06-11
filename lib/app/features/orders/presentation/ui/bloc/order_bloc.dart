import 'package:ecommerce_app/app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_app/app/features/cart/domain/entities/formated_cart_entity.dart';
import 'package:ecommerce_app/app/features/orders/presentation/ui/bloc/order_states.dart';
import 'package:ecommerce_app/app/features/search/presentation/bloc/search/search_events.dart';
import 'package:ecommerce_app/app/features/search/presentation/bloc/search/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cart/domain/use_cases/get_cart/get_cart_usecase.dart';
import '../../../domain/use_cases/get_orders/get_orders_usecase.dart';

import 'dart:developer' as developer;

import 'order_events.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  final GetOrdersUseCase getOrdersUsecase;

  OrdersBloc({required this.getOrdersUsecase}) : super(OrdersInitial()) {
    on<GetOrdersTriggered>((event, emit) async {
      developer.log('chamou');
      emit(OrdersLoadProgress());
      final getCartUseResult =
          await getOrdersUsecase(accessToken: event.accessToken);

      getCartUseResult.fold(
        (failure) => {
          emit(OrdersLoadFailure(failure: failure)),
        },
        (success) => {
          emit(
            OrdersLoadSuccess(
              orderProducts: success,
            ),
          ),
        },
      );
    });
    // on<CartFormatTriggered>((event, emit) async {
    //   List<CartEntity> tempCart = event.cartProducts;
    //   List<FormattedCartEntity> tempFormattedCart = [];
    //
    //   for (var element in tempCart) {
    //     var haveElement = false;
    //     for (var i = 0; i < tempFormattedCart.length; i++) {
    //       var secondElement = tempFormattedCart[i];
    //       if (element.product.name == secondElement.name) {
    //         haveElement = true;
    //         tempFormattedCart[i] = FormattedCartEntity(
    //             name: secondElement.name,
    //             quantity: secondElement.quantity + 1,
    //             price: secondElement.price,
    //             description: secondElement.description,
    //             imgUrl: secondElement.imgUrl,
    //             idToRemove: element.id,
    //             id: element.product.id);
    //         break;
    //       }
    //     }
    //     if (!haveElement) {
    //       tempFormattedCart.add(FormattedCartEntity(
    //           name: element.product.name,
    //           quantity: 1,
    //           price: element.product.price,
    //           description: element.product.description,
    //           imgUrl: element.product.image,
    //           idToRemove: element.id,
    //           id: element.product.id));
    //     }
    //   }
    //
    //   emit(CartFormatted(formattedCart: tempFormattedCart));
    // });
  }
}
