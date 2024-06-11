import 'package:ecommerce_app/app/core/mixins/dialog_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/admin_sign_in/admin_sign_in_bloc.dart';
import '../../bloc/admin_sign_in/admin_sign_in_events.dart';
import '../../bloc/admin_sign_in/admin_sign_in_states.dart';

class AdminSignInPage extends StatefulWidget {

  final String accessToken;

  const AdminSignInPage({super.key, required this.accessToken,});

  @override
  State<AdminSignInPage> createState() => _AdminSignInPageState();
}

class _AdminSignInPageState extends State<AdminSignInPage> with DialogMixins {
  final _adminSignInBloc = GetIt.I<AdminSignInBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _adminSignInBloc,
      child: SafeArea(
        child: BlocConsumer<AdminSignInBloc, AdminSignInStates>(
          listenWhen: (previous, current) =>
          current is AdminSignInLoadFailure ||
              current is AdminSignInLoadSuccess,
          listener: (context, state) {
            if (state is AdminSignInLoadSuccess) {
              showSuccessDialog(
                context: context,
                message: 'Usuário cadastrado com sucesso',
                dismissible: false,
                onPressed: () {
                  Navigator.pop(context, true);
                },
              );
            }
            if (state is AdminSignInLoadFailure) {
              showFailureDialog(
                context: context,
                message: 'Erro ao cadastrar usuário',
                dismissible: false,
              );
            }
          },
          buildWhen: (previous, current) => current is AdminSignInState,
          builder: (context, state) {
            if (state is AdminSignInState) {
              return Scaffold(
                body: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: Container(
                          height: 520,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Cadastrar Admin',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
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
                                                _adminSignInBloc.add(
                                                  NameChanged(name: value),
                                                );
                                              },
                                              maxLines: 1,
                                              decoration: const InputDecoration(
                                                hintStyle:
                                                TextStyle(fontSize: 15),
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
                                                _adminSignInBloc.add(
                                                  EmailChanged(email: value),
                                                );
                                              },
                                              maxLines: 1,
                                              decoration: const InputDecoration(
                                                hintStyle:
                                                TextStyle(fontSize: 15),
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
                                                _adminSignInBloc.add(
                                                  PhoneChanged(phone: value),
                                                );
                                              },
                                              maxLines: 1,
                                              decoration: const InputDecoration(
                                                hintStyle:
                                                TextStyle(fontSize: 15),
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
                                                _adminSignInBloc.add(
                                                  ImageUrlChanged(
                                                      imageUrl: value),
                                                );
                                              },
                                              maxLines: 1,
                                              decoration: const InputDecoration(
                                                hintStyle:
                                                TextStyle(fontSize: 15),
                                                hintText: 'URL da Imagem:',
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
                                                _adminSignInBloc.add(
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
                                                _adminSignInBloc.add(
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
                                    _adminSignInBloc.add(
                                      AdminSignInTriggered(
                                          accessToken: widget.accessToken,
                                      ),
                                    );
                                  },
                                  child: const Text('Cadastrar'),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
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
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
