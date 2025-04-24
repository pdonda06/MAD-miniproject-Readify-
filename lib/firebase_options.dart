import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
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
          'DefaultFirebaseOptions have not been configured for $defaultTargetPlatform - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }
  }

  // TODO: Replace these values with your actual Firebase configuration
  // Get these values from Firebase Console -> Project Settings -> General -> Your apps
   static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDuFfbxwR8KtgKVCY8ROmFQmR2adewkGwU',
    appId: '1:1086551660714:android:8c1ece69e867fc6d0458d3',
    messagingSenderId: '1086551660714',
    projectId: 'miniproj-ef8b1',
    authDomain: 'miniproj-ef8b1.firebaseapp.com',
    storageBucket: "miniproj-ef8b1.firebasestorage.app",
  );


}
