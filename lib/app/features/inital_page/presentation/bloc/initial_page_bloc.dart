import 'package:ecommerce_app/app/features/inital_page/presentation/bloc/initial_page_events.dart';
import 'package:ecommerce_app/app/features/inital_page/presentation/bloc/initial_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class InitialPageBloc extends Bloc<InitialPageEvents, InitialPageStates> {
  InitialPageBloc() : super(InitialPageNavigator(index: 0)) {
    on<NavigatorIndexTriggered>((event, emit) async {
      developer.log(event.index.toString());
      emit(InitialPageNavigator(
        index: event.index,
      ));
    });
  }
}
