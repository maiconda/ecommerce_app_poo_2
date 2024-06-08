import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Maicon de Oliveira da Silva',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          'Usuário Comum',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.7),
              margin: const EdgeInsets.only(bottom: 17, top: 15),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)
              ),
                child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: const Icon(FontAwesomeIcons.moneyCheckDollar, size: 30,),
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Pedidos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text('lorem ipsum kauanyu chata ipsum', style: TextStyle(color: Colors.black.withOpacity(0.8)),),
                        ],
                      ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: const Icon(FontAwesomeIcons.moneyCheckDollar, size: 30,),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Pedidos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text('lorem ipsum kauanyu chata ipsum', style: TextStyle(color: Colors.black.withOpacity(0.8)),),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: const Icon(FontAwesomeIcons.moneyCheckDollar, size: 30,),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Pedidos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text('lorem ipsum kauanyu chata ipsum', style: TextStyle(color: Colors.black.withOpacity(0.8)),),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: const Icon(FontAwesomeIcons.moneyCheckDollar, size: 30,),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Sobre', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text('lorem ipsum kauanyu chata ipsum', style: TextStyle(color: Colors.black.withOpacity(0.8)),),
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            )),
            const SizedBox(height: 20,),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: const BoxDecoration(
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 25),
                            child: const Icon(FontAwesomeIcons.moneyCheckDollar, size: 30,),
                          ),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Sobre', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  Text('lorem ipsum kauanyu chata ipsum', style: TextStyle(color: Colors.black.withOpacity(0.8)),),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
