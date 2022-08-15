import 'package:flutter/material.dart';

class PageNotFoundPage extends StatelessWidget {
  const PageNotFoundPage({
    Key? key,
    this.exception,
  }) : super(key: key);

  static const routeName = '/page-not-found-page';
  final Exception? exception;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Text(
          exception == null
              ? 'No exception details found.'
              : exception.toString(),
        ),
      ),
    );
  }
}
