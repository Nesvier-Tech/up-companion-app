import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../domain/core/network/repo_intf/network_repo_intf.dart';

class NetworkRepoImpl implements NetworkRepoIntf {
  final InternetConnectionChecker internetConnectionChecker;

  const NetworkRepoImpl({required this.internetConnectionChecker});

  @override
  Future<bool> get hasInternetConnection async {
    return await internetConnectionChecker.hasConnection;
  }
}
