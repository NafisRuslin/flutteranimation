import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
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
    apiKey: 'YOUR-WEB-API-KEY',
    appId: 'YOUR-WEB-APP-ID',
    messagingSenderId: 'YOUR-SENDER-ID',
    projectId: 'your-project-id',
    authDomain: 'your-project-id.firebaseapp.com',
    databaseURL: 'https://your-project-id-default-rtdb.firebaseio.com',
    storageBucket: 'your-project-id.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsZdRCod6AEdCQf7j5tWBBJ1pxTEofr0Y',
    appId: '1:79944709286:android:af25bddbdc30601370f067',
    messagingSenderId: '79944709286',
    projectId: 'flutteranimation-30cae',
    databaseURL: 'https://flutteranimation-30cae-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutteranimation-30cae.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBa7nuJ-rdexaGjsMv9SL2eUM2BntrDJ4c',
    appId: '1:79944709286:ios:32b62ec708e9ea2f70f067',
    messagingSenderId: '79944709286',
    projectId: 'flutteranimation-30cae',
    databaseURL: 'https://flutteranimation-30cae-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutteranimation-30cae.firebasestorage.app',
    iosBundleId: 'com.example.flutteranimation',
  );
}