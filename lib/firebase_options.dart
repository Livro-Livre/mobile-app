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
    apiKey: 'AIzaSyC_PLfq7Ows6c2jtMDb_hxZIjtq3aqAEu4',
    appId: '1:329305730892:web:b7da4edc551785c56269e9',
    messagingSenderId: '329305730892',
    projectId: 'teste-livro-livre',
    authDomain: 'teste-livro-livre.firebaseapp.com',
    storageBucket: 'teste-livro-livre.appspot.com',
    measurementId: 'G-TSQLF419Z3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBC4kdSMI7iVvTiwIEQbypoME8B-RudcNo',
    appId: '1:329305730892:android:eb80d894a9417d3f6269e9',
    messagingSenderId: '329305730892',
    projectId: 'teste-livro-livre',
    storageBucket: 'teste-livro-livre.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHLLxXVzlEy2wUC2NbZFX7u8zOk8XbpfA',
    appId: '1:329305730892:ios:5af527b17b742cd76269e9',
    messagingSenderId: '329305730892',
    projectId: 'teste-livro-livre',
    storageBucket: 'teste-livro-livre.appspot.com',
    iosClientId:
        '329305730892-jkhp5noqttvrv69nogrfmqp9g4sqb9m1.apps.googleusercontent.com',
    iosBundleId: 'org.livrolivre',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHLLxXVzlEy2wUC2NbZFX7u8zOk8XbpfA',
    appId: '1:329305730892:ios:91a723a3a095d70f6269e9',
    messagingSenderId: '329305730892',
    projectId: 'teste-livro-livre',
    storageBucket: 'teste-livro-livre.appspot.com',
    iosClientId:
        '329305730892-7p6vbl74dlhcmbt8amvmnnbib8lq8otc.apps.googleusercontent.com',
    iosBundleId: 'com.example.livroLivre',
  );
}