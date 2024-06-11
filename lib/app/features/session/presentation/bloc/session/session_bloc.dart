import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_events.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class SessionBloc extends Bloc<SessionEvents, SessionStates> {
  SessionBloc() : super(SessionInitial()) {

    on<SessionStarted>((event, emit) async {
      emit(
        SessionAuthentication(
          logged: false,
          accessToken: null,
          email: null,
          phone: null,
          name: null,
          imageUrl: null,
          roles: null
        ),
      );
      developer.log('chamando');
    });

    on<SessionAuthenticationChange>((event, emit) async {
      emit(
        SessionAuthentication(
          roles: event.roles,
          logged: event.logged,
          accessToken: event.accessToken,
          email: event.email,
          phone: event.phone,
          name: event.name,
          imageUrl: event.imageUrl
        ),
      );
    });
  }
}
