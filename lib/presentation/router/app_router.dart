import 'package:flutter/material.dart';

import '../pages/dashboard/dashboard.dart';
import '../pages/errors/page_not_found/page_not_found_page.dart';
import '../pages/forgot_password/forgot_password.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';
import '../pages/sign_up/sign_up_page.dart';

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
