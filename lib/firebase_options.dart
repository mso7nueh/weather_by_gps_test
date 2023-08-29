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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRsA4Y0UZsSshmtxJdyuOJqkiVhf2nzlA',
    appId: '1:36418845354:android:e6ae3d12a355cc95062ed3',
    messagingSenderId: '36418845354',
    projectId: 'weather-by-gps-test-63b29',
    storageBucket: 'weather-by-gps-test-63b29.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-DK8pcT6EdI5kcaB6ihIxF1S5RR-sV7w',
    appId: '1:36418845354:ios:d0fe1e6010684b70062ed3',
    messagingSenderId: '36418845354',
    projectId: 'weather-by-gps-test-63b29',
    storageBucket: 'weather-by-gps-test-63b29.appspot.com',
    iosClientId: '36418845354-qbacp1et2jh3oua45tb0ujc5fvoj5f98.apps.googleusercontent.com',
    iosBundleId: 'ru.mso7nueh.weatherByGpsTest',
  );
}