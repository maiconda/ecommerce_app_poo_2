import 'package:ecommerce_app/app/core/mixins/confirmation_mixin.dart';
import 'package:ecommerce_app/app/features/initial_page/presentation/bloc/initial_page_bloc.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_events.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/routes/routes_manager.dart';
import '../../../../initial_page/presentation/bloc/initial_page_events.dart';
import '../../../../session/presentation/bloc/session/session_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with ConfirmationMixin {
  late final SessionBloc _sessionBloc;
  late final InitialPageBloc _initialPageBloc;

  @override
  void initState() {
    _sessionBloc = context.read<SessionBloc>();
    _initialPageBloc = context.read<InitialPageBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocBuilder<SessionBloc, SessionStates>(
        buildWhen: (previous, current) => current is SessionAuthentication,
        builder: (context, state) {
          if (state is SessionAuthentication && state.logged == true) {
            return Padding(
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
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            state.imageUrl ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.name!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                state.roles![0].name == 'ADMIN'
                                    ? 'Administrador'
                                    : state.roles![0].name == 'USER'
                                        ? 'Usuário'
                                        : 'Usuário Desconhecido',
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
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
                                  child: const Icon(
                                    FontAwesomeIcons.moneyCheckDollar,
                                    size: 30,
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Pedidos',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'lorem ipsum kauanyu chata ipsum',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8)),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          if (state.roles![0].name == 'ADMIN') ...[
                            GestureDetector(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
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
                                      child: const Icon(
                                        FontAwesomeIcons.moneyCheckDollar,
                                        size: 30,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ver Usuários',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'lorem ipsum kauanyu chata ipsum',
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.8)),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
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
                                      child: const Icon(
                                        FontAwesomeIcons.moneyCheckDollar,
                                        size: 30,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Cadastrar Categoria',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'lorem ipsum kauanyu chata ipsum',
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.8)),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
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
                                      child: const Icon(
                                        FontAwesomeIcons.moneyCheckDollar,
                                        size: 30,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Cadastrar Produto',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'lorem ipsum kauanyu chata ipsum',
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.8)),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  RoutesManager.generateRoute(
                                    RouteSettings(
                                      name: RoutesManager.adminSignInPage,
                                      arguments: state.accessToken,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
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
                                      child: const Icon(
                                        FontAwesomeIcons.moneyCheckDollar,
                                        size: 30,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Cadastrar Administrador',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'lorem ipsum kauanyu chata ipsum',
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.8)),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                RoutesManager.generateRoute(const RouteSettings(
                                  name: RoutesManager.aboutPage,
                                )),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: const BoxDecoration(),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 25),
                                    child: const Icon(
                                      FontAwesomeIcons.moneyCheckDollar,
                                      size: 30,
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sobre',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'lorem ipsum kauanyu chata ipsum',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8)),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showConfirmOperationDialog(
                        context: context,
                        message: 'Você deseja sair?',
                        confirmFunction: () {
                          _sessionBloc.add(SessionAuthenticationChange(
                            logged: false,
                            accessToken: null,
                            email: null,
                            phone: null,
                            name: null,
                            imageUrl: null,
                            roles: null,
                          ));
                          Navigator.push(
                            context,
                            RoutesManager.generateRoute(const RouteSettings(
                              name: RoutesManager.logInPage,
                            )),
                          );
                          _initialPageBloc.add(
                            NavigatorIndexTriggered(index: 0),
                          );
                        },
                        cancelLabel: 'Cancelar',
                        confirmLabel: 'Sair',
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: const BoxDecoration(),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 25),
                                    child: const Icon(
                                      FontAwesomeIcons.powerOff,
                                      size: 30,
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sair',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'lorem ipsum kauanyu chata ipsum',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8)),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    ));
  }
}
