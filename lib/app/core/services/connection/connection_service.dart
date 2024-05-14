abstract interface class ConnectionService {
  void listenConectivity({
    required Function({required bool connected}) callback,
  });

  void dispose();

  Future<bool> returnCurrentStatus();
}
