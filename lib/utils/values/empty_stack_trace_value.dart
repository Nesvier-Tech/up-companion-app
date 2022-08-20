import 'value.dart';

class EmptyStackTraceValue extends Value implements StackTrace {
  const EmptyStackTraceValue();

  @override
  String toString() {
    return 'No available StackTrace.';
  }

  @override
  List<Object> get props => const [];
}
