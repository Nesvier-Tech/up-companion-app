import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login-page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
