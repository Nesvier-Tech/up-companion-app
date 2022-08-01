import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:up_companion_app/domain/entities/auth/user_entity.dart';

void main() {
  late final String tId;
  late final String tUsername;
  late final String tEmail;

  setUpAll(() {
    tId = '1';
    tUsername = 'Qubits';
    tEmail = 'qubits@gmail.com';
  });

  test('UserEntity should extend Equatable.', () {
    //* Act
    final tUserEntity = UserEntity(
      id: tId,
      username: tUsername,
      email: tEmail,
    );

    //* Assert
    expect(tUserEntity, isA<Equatable>());
  });

  test(
    'UserEntity should require three fields: id, username, and email. '
    'That is, they should not be null.',
    () {
      //* Act
      final tUserEntity = UserEntity(
        id: tId,
        username: tUsername,
        email: tEmail,
      );

      //* Assert
      expect(tUserEntity.id, isNotNull);
      expect(tUserEntity.username, isNotNull);
      expect(tUserEntity.email, isNotNull);
    },
  );
}
