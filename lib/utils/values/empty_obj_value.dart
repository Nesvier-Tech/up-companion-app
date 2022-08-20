import 'value.dart';

/// A class that simply represents an 'empty value.' to a given
/// variable, parameter, and the like. This is better than using
/// nullable placeholders and it will look much nicer when
/// testing the code or documenting it.
class EmptyObjValue extends Value {
  const EmptyObjValue();

  @override
  List<Object> get props => const [];
}
