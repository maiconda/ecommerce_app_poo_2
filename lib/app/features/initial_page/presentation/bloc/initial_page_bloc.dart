import 'package:flutter_bloc/flutter_bloc.dart';

import 'initial_page_events.dart';
import 'initial_page_states.dart';

class InitialPageBloc extends Bloc<InitialPageEvents, InitialPageStates> {
  InitialPageBloc() : super(InitialPageNavigator(index: 0)) {
    on<NavigatorIndexTriggered>((event, emit) async {
      emit(InitialPageNavigator(
        index: event.index,
      ));
    });
  }
}
