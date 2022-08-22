import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../domain/core/auth/entities/auth_status_entity.dart';
import '../../../../domain/core/auth/repo_intf/auth_repo_intf.dart';

class ListenOnAuthStateChangesRepoImpl {
  const ListenOnAuthStateChangesRepoImpl({required this.authProvider});

  final FirebaseAuth authProvider;

  StreamEitherAuthStatusEntity call({
    required StreamController<AuthStatusEntity> controller,
  }) {
    // TODO: implement listenOnAuthStateChanges
    throw UnimplementedError();
  }
}
