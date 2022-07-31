import 'package:flutter/material.dart';

class PageNotFoundPage extends StatelessWidget {
  static const routeName = 'page-not-found-page';

  const PageNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
