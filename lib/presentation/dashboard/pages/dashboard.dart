import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/dashboard-page';

  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
