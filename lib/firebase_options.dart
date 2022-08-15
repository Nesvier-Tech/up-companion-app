// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCTwJIpCJMemBUVpxwWHwVfn67G2eLeKu0',
    appId: '1:487341729545:web:626faff8478edc03c3d5d8',
    messagingSenderId: '487341729545',
    projectId: 'up-companion-app',
    authDomain: 'up-companion-app.firebaseapp.com',
    storageBucket: 'up-companion-app.appspot.com',
    measurementId: 'G-28PJSYT9B4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtnQDpxY8yror1jxnZJuXg0jhAyD-dSUY',
    appId: '1:487341729545:android:fd60bd2e013e95a0c3d5d8',
    messagingSenderId: '487341729545',
    projectId: 'up-companion-app',
    storageBucket: 'up-companion-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGfIgMBGf9atpHxpjtrQ74ilWC8pFrAKk',
    appId: '1:487341729545:ios:6704dd2a3eac20c3c3d5d8',
    messagingSenderId: '487341729545',
    projectId: 'up-companion-app',
    storageBucket: 'up-companion-app.appspot.com',
    androidClientId:
        '487341729545-d3e0gnseuo9fuqa6dturo556pug7dis1.apps.googleusercontent.com',
    iosClientId:
        '487341729545-75agpn83qf33mvl5nb10kvj6e96ksrni.apps.googleusercontent.com',
    iosBundleId: 'com.nesvier.upCompanionApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGfIgMBGf9atpHxpjtrQ74ilWC8pFrAKk',
    appId: '1:487341729545:ios:6704dd2a3eac20c3c3d5d8',
    messagingSenderId: '487341729545',
    projectId: 'up-companion-app',
    storageBucket: 'up-companion-app.appspot.com',
    androidClientId:
        '487341729545-d3e0gnseuo9fuqa6dturo556pug7dis1.apps.googleusercontent.com',
    iosClientId:
        '487341729545-75agpn83qf33mvl5nb10kvj6e96ksrni.apps.googleusercontent.com',
    iosBundleId: 'com.nesvier.upCompanionApp',
  );
}
