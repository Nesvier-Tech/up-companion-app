import 'package:flutter/material.dart';

import '../../core/loading/loading_dialog.dart';
import '../../errors/pages/page_not_found_page.dart';
import '../../login/pages/login_page.dart';
import '../../sign_up/pages/sign_up_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

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
              onPressed: () =>
                  Navigator.of(context).popAndPushNamed(HomePage.routeName),
              child: const Text('Home Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(LoginPage.routeName),
              child: const Text('Login Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(SignUpPage.routeName),
              child: const Text('Sign-Up Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  LoadingDialog.showLoadingDialog(context: context),
              child: const Text('Loading Dialog'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(PageNotFoundPage.routeName),
              child: const Text('Page Not Found Page'),
            ),
          ],
        ),
      ),
    );
  }
}
