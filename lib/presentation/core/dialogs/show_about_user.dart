part of 'dialogs.dart';

Future<String?> _showAboutUser({
  required BuildContext context,
  required String title,
  required String id,
  required String username,
  required String email,
  required String upCampus,
  required String dateCreated,
}) {
  return showDialog(
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
              const Text('ID:'),
              Text(id),
              const SizedBox(height: 3),
              const Text('Username:'),
              Text(username),
              const SizedBox(height: 3),
              const Text('Email:'),
              Text(email),
              const SizedBox(height: 3),
              const Text('UP Campus:'),
              Text(upCampus),
              const SizedBox(height: 3),
              const Text('Date Created:'),
              Text(dateCreated),
              const SizedBox(height: 3),
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
