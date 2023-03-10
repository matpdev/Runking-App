import 'package:runking_app/app/app.dart';
import 'package:runking_app/firebase_options.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FCMConfig.instance.init(
    defaultAndroidForegroundIcon:
        '@mipmap/ic_launcher', //default is @mipmap/ic_launcher
    defaultAndroidChannel: const AndroidNotificationChannel(
      'high_importance_channel', // same as value from android setup
      'Fcm config',
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound('notification'),
    ),
    onBackgroundMessage: _firebaseMessagingBackgroundHandler,
  );

  FCMConfig.instance.messaging.getToken().then((token) {
    print(token);
  });

  initializeDateFormatting().then((_) => runApp(const App()));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}
