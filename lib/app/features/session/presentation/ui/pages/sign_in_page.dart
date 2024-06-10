import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/routes/routes_manager.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Container(
                  height: 510,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width - 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        'Por favor, digite suas credenciais',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 30,),
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
                                        hintText: 'Nome:',
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
                      const SizedBox(height: 10,),
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
                                        hintText: 'Email:',
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
                      const SizedBox(height: 10,),
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
                                        hintText: 'Telefone:',
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
                      const SizedBox(height: 10,),
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
                      const SizedBox(height: 10,),
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
                      const SizedBox(height: 20,),
                      Container(width: double.infinity, height: 45,child: ElevatedButton(onPressed: () {}, child: const Text('Cadastrar'))),
                      const SizedBox(height: 15,),
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
