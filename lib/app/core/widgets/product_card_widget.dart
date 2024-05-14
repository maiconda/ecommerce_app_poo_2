import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // cor da sombra
            spreadRadius: 2, // raio de expansão da sombra
            blurRadius: 5, // raio de desfoque da sombra
            offset: Offset(0, 3), // deslocamento da sombra
          ),
        ],
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // cor da sombra
                    spreadRadius: 2, // raio de expansão da sombra
                    blurRadius: 10, // raio de desfoque da sombra
                    offset: Offset(0, 0), // deslocamento da sombra
                  ),
                ]
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Air Max 97',
          ),
          Text('NIKE'),
          Text('200'),
        ],
      ),
    );
  }
}
