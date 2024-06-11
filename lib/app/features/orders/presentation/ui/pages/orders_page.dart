import 'package:ecommerce_app/app/features/orders/presentation/ui/bloc/order_bloc.dart';
import 'package:ecommerce_app/app/features/orders/presentation/ui/bloc/order_events.dart';
import 'package:ecommerce_app/app/features/product/presentation/bloc/product/product_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class OrdersPage extends StatefulWidget {
  final String accessToken;

  const OrdersPage({super.key, required this.accessToken});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final _ordersBloc = GetIt.I<OrdersBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrdersBloc>(
            create: (context) =>
                _ordersBloc..add(GetOrdersTriggered(widget.accessToken))),
      ],
      child: SafeArea(
        child: Scaffold(
          body: ElevatedButton(
            onPressed: () {
              _ordersBloc.add(GetOrdersTriggered(widget.accessToken));
            },
            child: Text('rtads'),
          ),
        ),
      ),
    );
  }
}
