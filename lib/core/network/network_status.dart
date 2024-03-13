import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkStatus {
  Future<ConnectivityResult> getNetworkStatus() async {
    return await (Connectivity().checkConnectivity());
  }
}
