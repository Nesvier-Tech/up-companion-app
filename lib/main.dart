import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'presentation/core/router/app_router.dart';
import 'utils/service_locators/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  final AppRouter _appRouter = const AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upcapp - UP Companion App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
