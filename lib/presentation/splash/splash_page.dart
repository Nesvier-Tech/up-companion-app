import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../home/pages/home_page.dart';
import 'state_holders/bloc/auth_status_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.red[700]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'UPCAPP\n(UP Companion App)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () => context.go(HomePage.routeName),
              child: const Text('Bypass Splash Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AuthStatusBloc>()
                    .add(const AuthStatusListenerSignedOut());
              },
              child: const Text('Bloc Test Button'),
            ),
          ],
        ),
      ),
    );
  }
}
