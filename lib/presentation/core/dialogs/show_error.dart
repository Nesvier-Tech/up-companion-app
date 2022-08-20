part of 'dialogs.dart';

Future<String?> _showError({
  required BuildContext context,
  required String title,
  required String errorCode,
  required String errorMsg,
  required String errorSource,
  String? otherDetails,
  Object? errorObj,
  StackTrace? stackTrace,
}) {
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Error code:'),
              Text(errorCode),
              const SizedBox(height: 3),
              const Text('Error Message:'),
              Text(errorMsg),
              const SizedBox(height: 3),
              const Text('Error Source:'),
              Text(errorSource),
              const SizedBox(height: 3),
              if (otherDetails != null)
                Column(
                  children: <Widget>[
                    const Text('Other Details:'),
                    Text(otherDetails),
                    const SizedBox(height: 3),
                  ],
                ),
              if (errorObj != null)
                Column(
                  children: <Widget>[
                    const Text('Error Object:'),
                    Text(errorObj.toString()),
                    const SizedBox(height: 3),
                  ],
                ),
              if (stackTrace != null)
                Column(
                  children: <Widget>[
                    const Text('Stack Trace:'),
                    Text(stackTrace.toString()),
                    const SizedBox(height: 3),
                  ],
                ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop('Okay'),
          child: const Text('Okay'),
        )
      ],
    ),
  );
}
