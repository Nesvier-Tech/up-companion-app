import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:up_companion_app/domain/entities/auth/user_entity.dart';

void main() {
  group('UserEntity', () {
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
  });
}
