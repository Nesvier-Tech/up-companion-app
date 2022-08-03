import 'package:flutter/material.dart';

import '../../forgot_password/pages/forgot_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () =>
            Navigator.of(context).pushNamed(ForgotPasswordPage.routeName),
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 11,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
