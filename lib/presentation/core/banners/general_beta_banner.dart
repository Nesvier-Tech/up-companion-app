import 'package:flutter/material.dart';

class GeneralBetaBanner extends StatelessWidget {
  const GeneralBetaBanner({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Banner(
      message: 'BETA',
      location: BannerLocation.topEnd,
      color: Colors.orange,
      child: child,
    );
  }
}
