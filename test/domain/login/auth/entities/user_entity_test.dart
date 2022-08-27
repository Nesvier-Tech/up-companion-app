import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:up_companion_app/domain/core/auth/entities/user_entity.dart';
import 'package:up_companion_app/utils/constants/enums/up_campuses.dart';

void main() {
  late final String tId;
  late final String tUsername;
  late final String tEmail;
  late final UPCampuses tUpCampus;
  late final DateTime tDateCreated;

  setUpAll(() {
    tId = '1';
    tUsername = 'Qubits';
    tEmail = 'qubits@gmail.com';
    tUpCampus = UPCampuses.upDiliman;
    tDateCreated = DateTime.now();
  });

  test('UserEntity should extend Equatable.', () {
    //* Act
    final tUserEntity = UserEntity(
      id: tId,
      username: tUsername,
      email: tEmail,
      upCampus: tUpCampus,
      dateCreated: tDateCreated,
    );

    //* Assert
    expect(tUserEntity, isA<Equatable>());
  });

  test(
    'UserEntity should require the three fields: id, username, and email. '
    'That is, they should not be null.',
    () {
      //* Act
      final tUserEntity = UserEntity(
        id: tId,
        username: tUsername,
        email: tEmail,
        upCampus: tUpCampus,
        dateCreated: tDateCreated,
      );

      //* Assert
      expect(tUserEntity.id, isNotNull);
      expect(tUserEntity.username, isNotNull);
      expect(tUserEntity.email, isNotNull);
    },
  );
}
