import 'package:firebase_auth/firebase_auth.dart';

import '../../../../domain/core/auth/repo_intf/auth_repo_intf.dart';

class GetCurrentUserRepoImpl {
  const GetCurrentUserRepoImpl({required this.authProvider});

  final FirebaseAuth authProvider;

  EitherUserEntity call() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
