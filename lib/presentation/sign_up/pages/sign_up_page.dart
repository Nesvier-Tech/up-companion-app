import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const routeName = '/sign-up-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign-Up')),
      body: Center(
        child: Form(
            child: Column(
          children: <Widget>[],
        )),
      ),
    );
  }
}
