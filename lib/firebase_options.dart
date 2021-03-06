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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDJTyMwg-8y7Bt4IQ45Wg9pNPkTiij2o-U',
    appId: '1:267909970773:web:c350a11cd3beb7cb368ddc',
    messagingSenderId: '267909970773',
    projectId: 'ficar-295d8',
    authDomain: 'ficar-295d8.firebaseapp.com',
    storageBucket: 'ficar-295d8.appspot.com',
    measurementId: 'G-BW4EGCP7RV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDssEb0nZ5hPd5sJTf07xtk_aXesJPiHLQ',
    appId: '1:267909970773:android:46c5be429de3f996368ddc',
    messagingSenderId: '267909970773',
    projectId: 'ficar-295d8',
    storageBucket: 'ficar-295d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkkT6bjNdYak7jPWKchZoNJ3yGNX8xFVI',
    appId: '1:267909970773:ios:32d07cabb04033ef368ddc',
    messagingSenderId: '267909970773',
    projectId: 'ficar-295d8',
    storageBucket: 'ficar-295d8.appspot.com',
    iosClientId: '267909970773-9cs2tn00pd9mk2biiotu86oulsfv4u1c.apps.googleusercontent.com',
    iosBundleId: 'com.example.ficar',
  );
}
