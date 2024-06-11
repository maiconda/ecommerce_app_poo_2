import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCartWidget extends StatelessWidget {
  final bool isLast;
  final String imgUrl;
  final String description;
  final String name;
  final double price;
  final int quantity;
  final VoidCallback remove;
  final VoidCallback add;

  const ProductCartWidget(
      {super.key,
      required this.isLast,
      required this.imgUrl,
      required this.description,
      required this.name,
      required this.price,
      required this.quantity,
      required this.remove,
      required this.add});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: !isLast ? const EdgeInsets.only(bottom: 15) : null,
      margin: !isLast ? const EdgeInsets.only(bottom: 15) : null,
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
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.error,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
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
                  padding: const EdgeInsets.only(top: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 17.5),
                      ),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 13),
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
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        )),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  remove();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(6),
                                  width: 30,
                                  child: const Icon(
                                    FontAwesomeIcons.minus,
                                    size: 10,
                                  ),
                                ),
                              ),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              GestureDetector(
                                onTap: () {
                                  add();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(6),
                                  width: 30,
                                  child: const Icon(
                                    FontAwesomeIcons.plus,
                                    size: 10,
                                  ),
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
