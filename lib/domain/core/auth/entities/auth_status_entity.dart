import 'package:equatable/equatable.dart';

class AuthStatusEntity extends Equatable {
  const AuthStatusEntity({
    required this.isLoggedIn,
    required this.lastUpdated,
  });

  final bool isLoggedIn;
  final DateTime lastUpdated;

  @override
  List<Object> get props => [isLoggedIn, lastUpdated];
}
