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
    apiKey: 'AIzaSyCaNYW41LoITWVslEo2eh_Xf8gLPCMENIA',
    appId: '1:974882538050:web:aea0c06ae6d96ef191a3db',
    messagingSenderId: '974882538050',
    projectId: 'mytagcall-88278',
    authDomain: 'mytagcall-88278.firebaseapp.com',
    storageBucket: 'mytagcall-88278.appspot.com',
    measurementId: 'G-2TYF9X4Y12',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7_jI7tUJ_7vCmyvNDQPNsE_KxvWQnohY',
    appId: '1:974882538050:android:6fc7c62f771d196391a3db',
    messagingSenderId: '974882538050',
    projectId: 'mytagcall-88278',
    storageBucket: 'mytagcall-88278.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUnUmV9djaUtJkZoinbTRWbAsAybEp9F0',
    appId: '1:974882538050:ios:50a0ec9b74f76f0491a3db',
    messagingSenderId: '974882538050',
    projectId: 'mytagcall-88278',
    storageBucket: 'mytagcall-88278.appspot.com',
    iosBundleId: 'com.example.mytagcall',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUnUmV9djaUtJkZoinbTRWbAsAybEp9F0',
    appId: '1:974882538050:ios:200aceba6b6ac9d191a3db',
    messagingSenderId: '974882538050',
    projectId: 'mytagcall-88278',
    storageBucket: 'mytagcall-88278.appspot.com',
    iosBundleId: 'com.example.mytagcall.RunnerTests',
  );
}