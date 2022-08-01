import 'package:flutter/material.dart';

import '../../dashboard/pages/dashboard.dart';
import '../../errors/pages/page_not_found_page.dart';
import '../../forgot_password/pages/forgot_password.dart';
import '../../home/pages/home_page.dart';
import '../../login/pages/login_page.dart';
import '../../sign_up/pages/sign_up_page.dart';

class AppRouter {
  const AppRouter();

  Route onGenerateRoute(RouteSettings settings) {
    // final GlobalKey<ScaffoldState> key =
    //     settings.arguments as GlobalKey<ScaffoldState>;

    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case SignUpPage.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case ForgotPasswordPage.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case Dashboard.routeName:
        return MaterialPageRoute(builder: (_) => const Dashboard());
      default:
        return MaterialPageRoute(builder: (_) => const PageNotFoundPage());
    }
  }
}
