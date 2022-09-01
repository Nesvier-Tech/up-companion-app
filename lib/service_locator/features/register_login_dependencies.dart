import '../../../presentation/login/state_holders/cubit/login_cubit.dart';
import '../injection_container.dart';

void registerLoginDependencies() {
  // Cubit
  sl.registerFactory(
    () => LoginCubit(createUserWithEmailAndPassword: sl()),
  );
}
