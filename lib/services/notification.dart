
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService extends ChangeNotifier {

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //  initialize
  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    
    AndroidInitializationSettings androidInitializationSettings = 
        const AndroidInitializationSettings("ic_launcher");

    IOSInitializationSettings iosInitializationSettings =
        const IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidInitializationSettings,
          iOS: iosInitializationSettings,
        );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }


//  Instant Notification
  Future instantNotification() async{
    var android = const AndroidNotificationDetails(
        'id', 'chennel');

    var ios = const IOSNotificationDetails();

    var platform = NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.show(
        0,
        'Instant notification',
        'Demo Instant notification',
        platform,
        payload: 'Welcome to demo app');
  }

//  Image Notification
  Future imageNotification() async{
    var bigPicture = const BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('ic_launcher'),
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
      contentTitle: 'Demo Image Notification',
      summaryText: 'This is some notification',
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );

    var android = AndroidNotificationDetails('id', 'channel',
    styleInformation: bigPicture);

    var platform = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.show(
        0,
        'Instant notification',
        'Demo Image notification',
        platform,
        payload: 'Welcome to demo app');
  }

//  Stylish Notification
  Future stylishNotification() async{
    var android = const AndroidNotificationDetails(
        'id', 'channel',
      color: Colors.deepOrange,
      enableLights: true,
      enableVibration: true,
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
      styleInformation: MediaStyleInformation(
        htmlFormatContent: true,
        htmlFormatTitle: true,
      ),
    );

    var platform = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.show(
        0,
        'Instant notification',
        'Demo stylish notification',
        platform,
       );
  }

  Future scheduledNotification() async {

    var scheduleNotificationDateTime = DateTime.now().add(const Duration(seconds: 10));

    // var interval = RepeatInterval.everyMinute;
    var bigPicture = const BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('ic_launcher'),
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
      contentTitle: 'Demo Image Notification',
      summaryText: 'This is some notification',
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );

    var android = AndroidNotificationDetails('id', 'channel',
        styleInformation: bigPicture);

    var platform = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.schedule(
      0,
      'Schedule notification',
      'Demo Scheduled Notification ',
      scheduleNotificationDateTime,
      platform,
    );
  }

//  Cancel Notification
  Future cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}