import 'package:flutter/material.dart';

part 'show_about_user.dart';
part 'show_error.dart';

class Dialogs {
  const Dialogs();

  static Future<String?> showAboutUser({
    required BuildContext context,
    required String title,
    required String id,
    required String username,
    required String email,
    required String upCampus,
    required String dateCreated,
  }) {
    return _showAboutUser(
      context: context,
      title: title,
      id: id,
      username: username,
      email: email,
      upCampus: upCampus,
      dateCreated: dateCreated,
    );
  }

  static Future<String?> showError({
    required BuildContext context,
    required String title,
    required String errorCode,
    required String errorMsg,
    required String errorSource,
    String? otherDetails,
    Object? errorObj,
    StackTrace? stackTrace,
  }) {
    return _showError(
      context: context,
      title: title,
      errorCode: errorCode,
      errorMsg: errorMsg,
      errorSource: errorSource,
      otherDetails: otherDetails,
      errorObj: errorObj,
      stackTrace: stackTrace,
    );
  }
}
