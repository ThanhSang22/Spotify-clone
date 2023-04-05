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
    apiKey: 'AIzaSyDsetF1KfbH6CyDpxSYVKJLWWS9_a6p2Kg',
    appId: '1:193538358244:web:063cd1ec24404c2b97a5f1',
    messagingSenderId: '193538358244',
    projectId: 'spotify-c0225',
    authDomain: 'spotify-c0225.firebaseapp.com',
    storageBucket: 'spotify-c0225.appspot.com',
    measurementId: 'G-18YNQ82LGX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_VjdALDw8uKkJzjZzXs4B2YnOYEKkXf8',
    appId: '1:193538358244:android:821a5035c4bb13c797a5f1',
    messagingSenderId: '193538358244',
    projectId: 'spotify-c0225',
    storageBucket: 'spotify-c0225.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7ihDJjGzMu7NcUMokzhpw83l6n41tL98',
    appId: '1:193538358244:ios:462f66127a092de397a5f1',
    messagingSenderId: '193538358244',
    projectId: 'spotify-c0225',
    storageBucket: 'spotify-c0225.appspot.com',
    iosClientId: '193538358244-06cd0aetnldh8teoec397bhtlvu4usoq.apps.googleusercontent.com',
    iosBundleId: 'com.example.spotifyClone',
  );
}