import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:real_state/core/navigation_service/navigation_service.dart';

class ConnectionStatusListener {
  static final _singleton = ConnectionStatusListener._internal();

  ConnectionStatusListener._internal();

  bool hasShownNoInternet = false;

  final Connectivity _connectivity = Connectivity();

  static ConnectionStatusListener getInstance() => _singleton;

  bool hasConnection = false;
  bool noConnectionPage = false;


  StreamController connectionChangeController = StreamController.broadcast();

  Stream get connectionChange => connectionChangeController.stream;

  void _connectionChange(ConnectivityResult result) async {
    await checkConnection();
  }

  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        if(noConnectionPage) {
          NavigationService().back();
          noConnectionPage = false;
          hasConnection = true;
        }
      } else {
        hasConnection = false;
        noConnectionPage = true;
        // NavigationService().pushNamed(NamedRoutes.noConnection);
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }

  Future<void> initialize() async {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    await checkConnection();
  }

  void dispose() {
    connectionChangeController.close();
  }

  updateConnectivity(
    dynamic hasConnection,
    ConnectionStatusListener connectionStatus,
  ) {
    if (!hasConnection) {
      print("No Internet");
      connectionStatus.hasShownNoInternet = true;
      // MyApp().navigatorKey.currentState?.pushNamed(NamedRoutes.noConnection);
      // Navigator.pushNamed(
      //     context,
      //     NamedRoutes.noConnection);
    } else {
      if (connectionStatus.hasShownNoInternet) {
        print("Has Internet");
        connectionStatus.hasShownNoInternet = false;
        // Navigator.pop(context);
      }
    }
  }

  initNoInternetListener() async {
    var connectionStatus = ConnectionStatusListener.getInstance();
    await connectionStatus.initialize();
    if (!connectionStatus.hasConnection) {
      updateConnectivity(false, connectionStatus);
    }
    connectionStatus.connectionChange.listen((event) {
      updateConnectivity(event, connectionStatus);
    });
  }
}
