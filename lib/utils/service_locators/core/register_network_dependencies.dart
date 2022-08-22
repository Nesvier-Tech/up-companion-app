import '../../../data/core/network/repo_impl/network_repo_impl.dart';
import '../../../domain/core/network/repo_intf/network_repo_intf.dart';
import '../../../domain/core/network/use_cases/has_internet_connection.dart';
import '../injection_container.dart';

void registerNetworkDependencies() {
  //* Use case
  sl.registerLazySingleton(() => HasInternetConnection(networkRepoIntf: sl()));

  //* Repository
  sl.registerLazySingleton<NetworkRepoIntf>(
    () => NetworkRepoImpl(internetConnectionChecker: sl()),
  );
}
