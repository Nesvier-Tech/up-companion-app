import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = '/sign-up-page';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign-Up')),
      body: const Center(
        child: Text('Hello World! 1'),
      ),
    );
  }
}
