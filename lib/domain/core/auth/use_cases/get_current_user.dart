import '../repo_intf/auth_repo_intf.dart';

class GetCurrentUser {
  const GetCurrentUser({required this.authRepo});

  final AuthRepoIntf authRepo;

  EitherUserEntity call() {
    throw UnimplementedError();
  }
}
