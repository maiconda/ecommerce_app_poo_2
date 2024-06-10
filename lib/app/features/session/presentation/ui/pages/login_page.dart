import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              children: [
                Text('Entrar'),
                Text('Por favor, digite suas credenciais'),
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
                              padding: const EdgeInsets.only(left: 18, right: 15),
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
                                  hintText: 'Digite aqui',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              child: const Icon(
                                FontAwesomeIcons.xmark,
                                color: Colors.white,
                                size: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
