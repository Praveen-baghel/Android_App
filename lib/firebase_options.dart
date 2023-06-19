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
    apiKey: 'AIzaSyDn0LBo5WiunQLnKfCID8LnvEByhcxFSDo',
    appId: '1:338599702948:web:b07f1fed19bfda97d05131',
    messagingSenderId: '338599702948',
    projectId: 'android-app-69050',
    authDomain: 'android-app-69050.firebaseapp.com',
    storageBucket: 'android-app-69050.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnGgDYSVMQMVU9S21ozcybFZ3QW2_gvcg',
    appId: '1:338599702948:android:50c34bf91589e347d05131',
    messagingSenderId: '338599702948',
    projectId: 'android-app-69050',
    storageBucket: 'android-app-69050.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATQxVxeGOskzlFQNlZozmedlmYQpAChdE',
    appId: '1:338599702948:ios:96f9827206e8b17fd05131',
    messagingSenderId: '338599702948',
    projectId: 'android-app-69050',
    storageBucket: 'android-app-69050.appspot.com',
    iosClientId: '338599702948-iu2au5ttg2lp9b0l865dl64mfqq7vvjp.apps.googleusercontent.com',
    iosBundleId: 'com.example.androidApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATQxVxeGOskzlFQNlZozmedlmYQpAChdE',
    appId: '1:338599702948:ios:96f9827206e8b17fd05131',
    messagingSenderId: '338599702948',
    projectId: 'android-app-69050',
    storageBucket: 'android-app-69050.appspot.com',
    iosClientId: '338599702948-iu2au5ttg2lp9b0l865dl64mfqq7vvjp.apps.googleusercontent.com',
    iosBundleId: 'com.example.androidApp',
  );
}
