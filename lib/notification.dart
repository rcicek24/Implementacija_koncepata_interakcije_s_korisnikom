import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final notificationService = NotificationService();

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings);

    await _notificationsPlugin.initialize(settings: initializationSettings);
  }

  Future<bool> showNotification({
    int id = 0,
    String title = " Notification",
    String body = "This is a notification message",
  }) async {
    final android = _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    bool dopusteno = await android?.areNotificationsEnabled() ?? false;

    if (!dopusteno) {
      dopusteno = await android?.requestNotificationsPermission() ?? false;
    }

    if (!dopusteno) return false;

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          "default_channel",
          "Default Channel",
          channelDescription: "Obavijest o prvoj fazi projekta",
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          showWhen: true,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _notificationsPlugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: notificationDetails,
    );
    return true;
  }

  Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id: id);
  }

  Future<void> cancelAllNotification() async {
    await _notificationsPlugin.cancelAll();
  }
}
