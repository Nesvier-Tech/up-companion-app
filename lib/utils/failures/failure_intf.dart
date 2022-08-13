import 'package:equatable/equatable.dart';

abstract class FailureIntf extends Equatable {
  final Map<String, dynamic> properties;

  /// If the subclasses have some properties, they'll get passed to
  /// this constructor. so that [Equatable] can perform value comparison.
  const FailureIntf({this.properties = const <String, dynamic>{}});

  @override
  List<Object> get props => [properties];
}
