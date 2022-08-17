import 'package:dartz/dartz.dart';

import '../../../../utils/failures/failure_intf.dart';
import '../entities/user_entity.dart';
import '../repo_intf/auth_repo_intf.dart';

class CreateUserWithEmailAndPassword {
  const CreateUserWithEmailAndPassword({required this.authRepo});

  final AuthRepoIntf authRepo;

  Future<Either<FailureIntf<Params>, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
