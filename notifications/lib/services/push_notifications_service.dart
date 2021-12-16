//SHA1: C6:18:3E:6B:69:80:C5:4F:8B:B3:BB:1B:A5:BB:CE:E3:47:24:D2:9F
// device token pixel 5: feP-HHzZR_ivrSAReApWb0:APA91bEkivwDQ1reZLry8ueydGmMBHFmipKq8Wjz-dM-7DqRqe9WgQjd2DMsSMMPkQL85iEllqj8lqRh8sXtMf1bk_IAxt5t-rg73nJWzP_pEfAsBRXw4Hmm9A9JP5JqXanJQd7f3SVY

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream =
      new StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _onBackgroundHandler(RemoteMessage message) async {
    // print('onBackground Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print('onMessage Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future _onMessageOpenAppHandler(RemoteMessage message) async {
    // print('onMessageOpenApp Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future initializeApp() async {
    //push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    //handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenAppHandler);

    //local notifications
  }

  static closeStreams() {
    _messageStream.close();
  }
}
