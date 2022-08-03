import 'package:flutter/material.dart';

import '../../sign_up/pages/sign_up_page.dart';

class CreateAcctCTA extends StatelessWidget {
  const CreateAcctCTA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'New to UPCAPP? ',
          style: TextStyle(
            fontSize: 11,
            color: Colors.black54,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(SignUpPage.routeName),
          child: const Text(
            'Create a FREE account!',
            style: TextStyle(
              fontSize: 11,
              color: Colors.black54,
            ),
          ),
        )
      ],
    );
  }
}
