import 'package:flutter_bloc/flutter_bloc.dart';
import '../connection_service.dart';

class ConnectionCubit extends Cubit<bool> {
  final ConnectionService connectionService;

  ConnectionCubit({required this.connectionService}) : super(true) {
    _start();
  }

  @override
  Future<void> close() {
    connectionService.dispose();
    return super.close();
  }

  Future<void> _start() async {
    final currentConnectionStatus =
    await connectionService.returnCurrentStatus();

    if (currentConnectionStatus != state) {
      emit(currentConnectionStatus);
    }

    connectionService.listenConectivity(
      callback: ({required connected}) => emit(connected),
    );
  }
}
