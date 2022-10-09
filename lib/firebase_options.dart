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
    apiKey: 'AIzaSyDGV9yv6e9f2zlvmHDSVXFyPDIYH0vILfg',
    appId: '1:1070804224791:web:7a6b81f5dbee2a7f55c552',
    messagingSenderId: '1070804224791',
    projectId: 'whatapp-clone-10f04',
    authDomain: 'whatapp-clone-10f04.firebaseapp.com',
    storageBucket: 'whatapp-clone-10f04.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD226zNAo5OrjV4nbyRlW8PI9Q-99TO7Mw',
    appId: '1:1070804224791:android:c13210c3fe4a598155c552',
    messagingSenderId: '1070804224791',
    projectId: 'whatapp-clone-10f04',
    storageBucket: 'whatapp-clone-10f04.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByZOPyfaTAJQvFeCpfIz4tI9IvIc_cZBc',
    appId: '1:1070804224791:ios:4e792dfbc2d3049055c552',
    messagingSenderId: '1070804224791',
    projectId: 'whatapp-clone-10f04',
    storageBucket: 'whatapp-clone-10f04.appspot.com',
    androidClientId: '1070804224791-n119uhbutmq4ibvurcov8qh7agnlo79q.apps.googleusercontent.com',
    iosClientId: '1070804224791-e2k9mj3b6dn8sndstida19k1m2nuiq4r.apps.googleusercontent.com',
    iosBundleId: 'com.example.wallpaperApp',
  );
}