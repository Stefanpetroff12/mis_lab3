
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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

  static FirebaseOptions android = const FirebaseOptions(
      apiKey: "AIzaSyD6e_N3lfrPkiEl04BxoaNitfgKVpJbhIs",
      appId: "1:442594074660:web:7f8d3fc6e340f88a6eb8b1",
      messagingSenderId: "442594074660",
      projectId: "lab-3-fb695",
      storageBucket: "lab-3-fb695.firebasestorage.app"
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyD6e_N3lfrPkiEl04BxoaNitfgKVpJbhIs",
    appId: "1:442594074660:web:7f8d3fc6e340f88a6eb8b1",
    messagingSenderId: "442594074660",
    projectId: "lab-3-fb695",
    storageBucket: "lab-3-fb695.firebasestorage.app",
    iosBundleId: 'com.example.lab2',
  );
}
