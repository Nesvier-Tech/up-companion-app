import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../utils/failures/failure_intf.dart';
import '../repo_intf/auth_repo_intf.dart';

class CreateUserWithEmailAndPassword {
  final AuthRepoIntf authRepo;

  const CreateUserWithEmailAndPassword({required this.authRepo});

  Future<Either<FailureIntf, UserCredential>> call({
    required String email,
    required String password,
  }) async {
    return await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
