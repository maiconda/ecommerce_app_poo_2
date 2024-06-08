import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCartWidget extends StatelessWidget {
  final bool isLast;
  const ProductCartWidget({super.key, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: !isLast ? const EdgeInsets.only(bottom: 15) : null,
      margin: !isLast ? const EdgeInsets.only(bottom: 15): null,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: !isLast ? Colors.black.withOpacity(0.5) : Colors.transparent,
            width: !isLast ? .75 : 0,
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
              borderRadius: BorderRadius.circular(10), // Set your desired radius
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Ensure the radius matches the container's
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd-q2Sn6Blje7-b7A44Y7XZ1CWCaltO-fOSKdnmIoWcROzz-BVOme68nRfgFJ5PZ4RIps&usqp=CAU',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cadeira Retrátil',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 17.5),
                      ),
                      Text(
                        'lorem ipsum bala bla pote',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          "RS128.00",
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
                              const Text('5', style: TextStyle(fontWeight: FontWeight.w600),),
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
