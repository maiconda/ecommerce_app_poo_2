import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_events.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionBloc extends Bloc<SessionEvents, SessionStates> {
  SessionBloc() : super(SessionInitial()) {

    on<SessionStarted>((event, emit) async {
      emit(
        SessionSituation(
          logged: false,
          accessToken: null,
          email: null,
          phone: null,
          name: null,
          userName: null,
          password: null,
        ),
      );
    });

    on<SessionSituationChange>((event, emit) async {
      emit(
        SessionSituation(
          logged: event.logged,
          accessToken: event.accessToken,
          email: event.email,
          phone: event.phone,
          name: event.name,
          userName: event.userName,
          password: event.password,
        ),
      );
    });
  }
}
