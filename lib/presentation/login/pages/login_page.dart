import 'package:flutter/material.dart';

import '../widgets/create_acct_cta.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login-page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Image.asset(
                  'assets/photos/University_of_The_Philippines_seal.png',
                  fit: BoxFit.scaleDown,
                  height: 200,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Login to UPCAPP',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30),
                const LoginForm(),
                const SizedBox(height: 20),
                const CreateAcctCTA(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
