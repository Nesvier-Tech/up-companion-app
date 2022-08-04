import '../repo_intf/network_repo_intf.dart';

class HasInternetConnection {
  final NetworkRepoIntf networkRepoIntf;

  const HasInternetConnection({required this.networkRepoIntf});

  Future<bool> call() async {
    return await networkRepoIntf.hasInternetConnection;
  }
}
