import 'package:ecommerce_app/app/core/mixins/dialog_mixins.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/login/login_bloc.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/login/login_events.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/login/login_states.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/routes/routes_manager.dart';
import '../../bloc/session/session_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with DialogMixins{
  final _loginBloc = GetIt.I<LoginBloc>();
  late final SessionBloc _sessionBloc;

  @override
  void initState() {
    _sessionBloc = context.read<SessionBloc>();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => _loginBloc,
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<LoginBloc, LoginStates>(
            listenWhen: (previous, current) =>
            current is LoginLoadSuccess || current is LoginLoadFailure,
            listener: (context, state) {
              if (state is LoginLoadSuccess) {
                _sessionBloc.add(
                    SessionAuthenticationChange(
                      logged: true,
                      accessToken: state.userEntity.accessToken,
                      email: state.userEntity.email,
                      phone: state.userEntity.phone,
                      name: state.userEntity.name,
                      imageUrl: state.userEntity.imageUrl,
                      roles: state.userEntity.roles,
                    )
                );
                Navigator.pop(context, true);
              } if (state is LoginLoadFailure) {
                showFailureDialog(context: context, message: 'Não foi possivel entrar');
              }
            },
            buildWhen: (previous, current) => current is LoginState,
            builder: (context, state) {
              if (state is LoginState) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(30),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Entrar',
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
                              const SizedBox(
                                height: 30,
                              ),
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
                                            padding: const EdgeInsets.only(
                                                left: 18, right: 15),
                                            child: const Icon(
                                              FontAwesomeIcons.magnifyingGlass,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Expanded(
                                            child: TextField(
                                              onChanged: (value) {
                                                _loginBloc.add(
                                                  UserNameChanged(
                                                      userName: value),
                                                );
                                              },
                                              maxLines: 1,
                                              decoration: const InputDecoration(
                                                hintStyle:
                                                TextStyle(fontSize: 15),
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
                              const SizedBox(
                                height: 10,
                              ),
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
                                            padding: const EdgeInsets.only(
                                                left: 18, right: 15),
                                            child: const Icon(
                                              FontAwesomeIcons.magnifyingGlass,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Expanded(
                                            child: TextField(
                                              onChanged: (value) {
                                                _loginBloc.add(
                                                  PasswordChanged(
                                                      password: value),
                                                );
                                              },
                                              maxLines: 1,
                                              decoration: const InputDecoration(
                                                hintStyle:
                                                TextStyle(fontSize: 15),
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
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: !state.valid
                                      ? null
                                      : () {
                                    _loginBloc.add(LoginTriggered());
                                  },
                                  child: const Text('Entrar'),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      RoutesManager.generateRoute(
                                          const RouteSettings(
                                            name: RoutesManager.signInPage,
                                          )),
                                    );
                                  },
                                  child: const Text('Criar nova conta')),
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
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
