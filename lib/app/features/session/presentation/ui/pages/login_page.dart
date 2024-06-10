import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/routes/routes_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width - 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Entrar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Por favor, digite suas credenciais',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.only(left: 18, right: 15),
                                    child: const Icon(
                                      FontAwesomeIcons.magnifyingGlass,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ),
                                  const Expanded(
                                    child: TextField(
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 15),
                                        hintText: 'Nome de Usuário:',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.only(left: 18, right: 15),
                                    child: const Icon(
                                      FontAwesomeIcons.magnifyingGlass,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ),
                                  const Expanded(
                                    child: TextField(
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 15),
                                        hintText: 'Senha:',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(width: double.infinity, height: 45,child: ElevatedButton(onPressed: () {}, child: Text('Entrar'))),
                      SizedBox(height: 15,),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              RoutesManager.generateRoute(
                                const RouteSettings(
                                  name: RoutesManager.signInPage,
                                )),
                              );

                          },child: Text('Criar nova conta')),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
