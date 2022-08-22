import '../repo_intf/auth_repo_intf.dart';

class CreateUserWithEmailAndPassword {
  const CreateUserWithEmailAndPassword({required this.authRepo});

  final AuthRepoIntf authRepo;

  FutureEitherUserEntity call({
    required String email,
    required String password,
  }) async {
    return await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
