import 'package:equatable/equatable.dart';
import 'package:up_companion_app/utils/params/params_intf.dart';

abstract class FailureIntf<ParamType extends ParamsIntf> extends Equatable {
  /// If the subclasses have some properties, they'll get passed to
  /// this constructor. so that [Equatable] can perform value comparison.
  const FailureIntf({required this.params});

  final ParamType params;

  @override
  List<Object> get props => [params];
}
