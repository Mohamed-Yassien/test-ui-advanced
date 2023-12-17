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
    apiKey: 'AIzaSyBdbiDtCqodEtWtiiK47wIYJuujEqdRXvU',
    appId: '1:402296724958:web:5fe92f23bdf0bdc1fe914f',
    messagingSenderId: '402296724958',
    projectId: 'test-ui-advanced',
    authDomain: 'test-ui-advanced.firebaseapp.com',
    storageBucket: 'test-ui-advanced.appspot.com',
    measurementId: 'G-HT31RJ7X14',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRh_QEfu8wUmQmkQsQtsy812MnjgmdUAA',
    appId: '1:402296724958:android:62faf95e61f758eefe914f',
    messagingSenderId: '402296724958',
    projectId: 'test-ui-advanced',
    storageBucket: 'test-ui-advanced.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRmRux0113l3-SXhnc1b8yzX-iDhr5s6E',
    appId: '1:402296724958:ios:ecce13fbbe1de0f2fe914f',
    messagingSenderId: '402296724958',
    projectId: 'test-ui-advanced',
    storageBucket: 'test-ui-advanced.appspot.com',
    iosBundleId: 'com.example.testUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRmRux0113l3-SXhnc1b8yzX-iDhr5s6E',
    appId: '1:402296724958:ios:7f095eb9abee8ecbfe914f',
    messagingSenderId: '402296724958',
    projectId: 'test-ui-advanced',
    storageBucket: 'test-ui-advanced.appspot.com',
    iosBundleId: 'com.example.testUi.RunnerTests',
  );
}