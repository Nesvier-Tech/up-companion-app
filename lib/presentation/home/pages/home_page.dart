import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:up_companion_app/presentation/errors/pages/page_not_found_page.dart';
import 'package:up_companion_app/presentation/splash/splash_page.dart';

import '../../login/pages/login_page.dart';
import '../../sign_up/pages/sign_up_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go(SplashPage.routeName),
              child: const Text('Splash Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go(HomePage.routeName),
              child: const Text('Home Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.push(LoginPage.routeName),
              child: const Text('Login Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.push(SignUpPage.routeName),
              child: const Text('Sign-Up Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.push(PageNotFoundPage.routeName),
              child: const Text('Page Not Found Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.push('/unknown-page'),
              child: const Text('Unknown Page'),
            ),
          ],
        ),
      ),
    );
  }
}
