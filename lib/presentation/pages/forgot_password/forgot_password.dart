import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const routeName = '/forgot-password-page';

  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
