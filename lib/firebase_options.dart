// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
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
        return windows;
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
    apiKey: 'AIzaSyD-I2d38Pk3Xr96FYY7c-uOnbba0b6q-VA',
    appId: '1:430578019700:web:429c0965b2bfa6001fd021',
    messagingSenderId: '430578019700',
    projectId: 'placement-app-fec14',
    authDomain: 'placement-app-fec14.firebaseapp.com',
    storageBucket: 'placement-app-fec14.appspot.com',
    measurementId: 'G-4J346RT8W0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsUuT4tQwWSE1gbewcfVgTBaTJA7Ew2mM',
    appId: '1:430578019700:android:0a5e008da10bfade1fd021',
    messagingSenderId: '430578019700',
    projectId: 'placement-app-fec14',
    storageBucket: 'placement-app-fec14.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAoH03SCr2XHvp3EtY6YOhkQaeT8jjUkYQ',
    appId: '1:430578019700:ios:8afe083ab346745d1fd021',
    messagingSenderId: '430578019700',
    projectId: 'placement-app-fec14',
    storageBucket: 'placement-app-fec14.appspot.com',
    iosBundleId: 'com.example.placementApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAoH03SCr2XHvp3EtY6YOhkQaeT8jjUkYQ',
    appId: '1:430578019700:ios:8afe083ab346745d1fd021',
    messagingSenderId: '430578019700',
    projectId: 'placement-app-fec14',
    storageBucket: 'placement-app-fec14.appspot.com',
    iosBundleId: 'com.example.placementApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD-I2d38Pk3Xr96FYY7c-uOnbba0b6q-VA',
    appId: '1:430578019700:web:80ae277235b8a9d31fd021',
    messagingSenderId: '430578019700',
    projectId: 'placement-app-fec14',
    authDomain: 'placement-app-fec14.firebaseapp.com',
    storageBucket: 'placement-app-fec14.appspot.com',
    measurementId: 'G-EXRER3LSVC',
  );

  // Realtime Database URL
  static const String databaseUrl = 'https://placement-app-fec14-default-rtdb.asia-southeast1.firebasedatabase.app/';
}
