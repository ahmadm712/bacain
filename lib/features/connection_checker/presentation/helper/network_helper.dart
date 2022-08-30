import 'package:bacain/features/connection_checker/presentation/bloc/connection_checker_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        ConnectionCheckerBloc().add(const NetworkNotify());
      } else {
        ConnectionCheckerBloc().add(const NetworkNotify(isConnected: true));
      }
    });
  }
}
