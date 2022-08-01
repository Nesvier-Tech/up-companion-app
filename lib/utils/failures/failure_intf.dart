import 'package:equatable/equatable.dart';

abstract class FailureIntf extends Equatable {
  final List<Object>? properties;

  /// If the subclasses have some properties, they'll get passed to
  /// this constructor. so that [Equatable] can perform value comparison.
  const FailureIntf({this.properties});

  @override
  List<Object?> get props => [properties];
}
