import 'value.dart';

class EmptyStrValue extends Value {
  const EmptyStrValue();

  static String get() => 'null';

  @override
  String toString() {
    return 'null';
  }

  @override
  List<Object> get props => const [];
}
