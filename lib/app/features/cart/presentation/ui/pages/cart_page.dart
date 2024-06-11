import 'package:ecommerce_app/app/features/cart/presentation/bloc/cart_events.dart';
import 'package:ecommerce_app/app/features/cart/presentation/bloc/cart_states.dart';
import 'package:ecommerce_app/app/features/cart/presentation/ui/widgets/product_cart_widget.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_bloc.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cartBloc = GetIt.I<CartBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionStates>(
      buildWhen: (previous, current) => current is SessionAuthentication,
      builder: (context, state) {
        if (state is SessionAuthentication) {
          return BlocProvider<CartBloc>(
            create: (context) => _cartBloc
              ..add(
                CartTriggered(state.accessToken!),
              ),
            child: BlocConsumer<CartBloc, CartStates>(
              listenWhen: (previous, current) => current is CartLoadSuccess,
              listener: (context, listenerState) {
                if (listenerState is CartLoadSuccess) {
                  _cartBloc.add(CartFormatTriggered(
                    cartProducts: listenerState.cartProducts,
                  ));
                }
              },
              buildWhen: (previous, current) =>
                  current is CartLoadSuccess || current is CartFormatted,
              builder: (secondSuccess, secondState) {
                if (secondState is CartFormatted) {
                  return SafeArea(
                    child: Scaffold(
                      body: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 0),
                              child: const Text(
                                'Carrinho de Compras',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 0, bottom: 12),
                              child: const Text(
                                '5 Items',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.black.withOpacity(0.7),
                              margin: const EdgeInsets.only(bottom: 17),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListView.builder(
                                  itemCount: secondState.formattedCart.length,
                                  itemBuilder: (context, index) {
                                    return ProductCartWidget(
                                      name: secondState.formattedCart[index].name,
                                      quantity: secondState.formattedCart[index].quantity,
                                      description: secondState.formattedCart[index].description,
                                      imgUrl: secondState.formattedCart[index].imgUrl,
                                      price: secondState.formattedCart[index].price,
                                      isLast: index == secondState.formattedCart.length - 1 ? true : false,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              padding: const EdgeInsets.only(top: 11.5),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.black.withOpacity(0.5),
                                    width: .75,
                                  ),
                                ),
                              ),
                              child: const Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Subtotal',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                                  Text(
                                    'RS12000.00',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Finalizar Compra',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )))
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
