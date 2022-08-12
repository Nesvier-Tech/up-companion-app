import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingDialog {
  const LoadingDialog();

  static Future<void> showLoadingDialog({
    required BuildContext context,
    bool isBarrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: isBarrierDismissible,
      builder: (_) => SimpleDialog(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 200,
            child: const RiveAnimation.asset(
              'assets/rive/loading-clock.riv',
            ),
          ),
          const Text(
            'Loading...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
