import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCartWidget extends StatelessWidget {
  final bool isLast;
  final String imgUrl;
  final String description;
  final String name;
  final double price;
  final int quantity;
  const ProductCartWidget({super.key, required this.isLast, required this.imgUrl, required this.description, required this.name, required this.price, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: !isLast ? const EdgeInsets.only(bottom: 15) : null,
      margin: !isLast ? const EdgeInsets.only(bottom: 15): null,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: !isLast ? Colors.black.withOpacity(0.5) : Colors.transparent,
            width: !isLast ? .8 : 0,
          ),
        ),
      ),
      height: 170,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            height: double.infinity,
            width: 125,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 17.5),
                      ),
                      Text(
                        description,
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        )),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child:  Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 6),
                                width: 30,
                                child: const Icon(
                                  FontAwesomeIcons.minus,
                                  size: 10,
                                ),
                              ),
                              Text(quantity.toString(), style: TextStyle(fontWeight: FontWeight.w600),),
                              Container(
                                margin: const EdgeInsets.only(left: 6),
                                width: 30,
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  size: 10,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
