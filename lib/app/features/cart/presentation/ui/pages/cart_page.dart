import 'package:ecommerce_app/app/features/cart/presentation/ui/widgets/product_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0, bottom: 12),
                child: const Text(
                  '5 Items',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ProductCartWidget(
                        isLast: index == 1 ? true : false,
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
                      color:Colors.black.withOpacity(0.5) ,
                      width: .75,
                    ),
                  ),
                ),
                child: const Row(
                  children: [
                    Expanded(child: Text('Subtotal', style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),)),
                    Text('RS12000.00', style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20,),
                child: ElevatedButton(onPressed: () {

                }, child: const Text('Finalizar Compra', style: TextStyle(fontWeight: FontWeight.w400),))
              )
            ],
          ),
        ),
      ),
    );
  }
}
