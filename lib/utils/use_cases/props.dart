import 'package:equatable/equatable.dart';

class Props extends Equatable {
  final List<Object?>? properties;

  const Props({this.properties});

  @override
  List<Object?> get props => [properties];
}
