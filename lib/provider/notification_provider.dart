import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/data/models/local/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationModel> notifications = [];
  Timer? _timer;

  final List<NotificationModel> foodNotifications = [
    NotificationModel(
      title: "Hələ də sifariş verməmisən? 🤔",
      description:
          "Bir birindən ləziz soslu dönərlərimizin dadına baxmağa tələs😋",
      icon: Icons.kebab_dining,
    ),
    NotificationModel(
      title: "Yeni məhsul! 🍕",
      description: "Xüsusi souslu İtalyana style pizza səni gözləyir",
      icon: Icons.local_pizza,
    ),
    NotificationModel(
      title: "Şirniyyat həyəcanı! 🍰",
      description: "Yeni çıxan desertlərimizdən 20% endirim",
      icon: Icons.cake,
    ),
    NotificationModel(
      title: "Səhər yeməyi saatı 🍳",
      description: "Xüsusi səhər menyusu yalnız səhər 08:00-11:00 arası",
      icon: Icons.breakfast_dining,
    ),
  ];

  NotificationProvider() {
    _addNotification();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _addNotification();
    });
  }

  void _addNotification() {
    final random = Random();
    NotificationModel newNotification =
        foodNotifications[random.nextInt(foodNotifications.length)];
    notifications.insert(0, newNotification);
    notifyListeners();
  }

  void removeNotificationAt(int index) {
    notifications.removeAt(index);
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
