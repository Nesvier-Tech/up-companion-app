import 'package:get_it/get_it.dart';
import 'package:up_companion_app/service_locator/features/register_splash_dependencies.dart';

import 'core/register_auth_dependencies.dart';
import 'core/register_network_dependencies.dart';
import 'external/register_external_dependencies.dart';
import 'features/register_login_dependencies.dart';
import 'utils/register_convertor_dependencies.dart';

final sl = GetIt.instance;

void init() {
  //* Core
  registerNetworkDependencies();
  registerAuthDependencies();

  //* Features
  registerLoginDependencies();
  registerSplashDependencies();

  //* Utils
  registerConvertorDependencies();

  //* External
  registerExternalDependencies();
}
