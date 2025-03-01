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
    NotificationModel(
        title: "Bu gün doğum günündür? 🎉",
        description:
            "Elə isə buyur Frangoya. Çünki Frangoda doğum günü olanlara bütün menyu 20% endirimlədir 😍",
        icon: Icons.celebration),
    NotificationModel(
      title: "Dadlı burgerlərimizdən xəbərdarsan? 🍔",
      description: "Xüsusi ədviyyatlarla hazırlanmış burgerlərimizi sına!",
      icon: Icons.lunch_dining,
    ),
    NotificationModel(
      title: "İsti içkilərlə isin! ☕",
      description:
          "Qış günlərində isti çay və kofelərimizlə isinmək üçün bizə qoşul!",
      icon: Icons.local_cafe,
    ),
    NotificationModel(
      title: "Ailəvi endirim! 👨‍👩‍👧‍👦",
      description:
          "Ailənizlə birlikdə gəlin, 4 nəfərlik menyulara 15% endirim qazanın!",
      icon: Icons.family_restroom,
    ),
    NotificationModel(
      title: "2 al, 1 hədiyyə! 🎁",
      description: "Sevimli içkilərindən 2 ədəd al, 3-cüsü bizdən olsun!",
      icon: Icons.local_drink,
    ),
    NotificationModel(
      title: "Pulsuz çatdırılma! 🚀",
      description:
          "Bu gün xüsusi kampaniya! Minimum 15 AZN sifarişə pulsuz çatdırılma!",
      icon: Icons.delivery_dining,
    ),
    NotificationModel(
      title: "Sağlam qidalan! 🥗",
      description: "Yeni fitnes menyumuzla sağlam və dadlı seçimlər et!",
      icon: Icons.emoji_nature,
    ),
    NotificationModel(
      title: "Gecə acanlara özəl! 🌙",
      description: "Saat 23:00-dan sonra sifarişlərdə 10% endirim!",
      icon: Icons.nightlife,
    ),
    NotificationModel(
      title: "Dostunu dəvət et, bonus qazan! 🎊",
      description: "Dostunu gətir, hər ikinizə 5 AZN hədiyyə balansı verək!",
      icon: Icons.group_add,
    ),
    NotificationModel(
      title: "Sushi həvəskarları üçün! 🍣",
      description: "Bu həftə bütün sushi menyularına 10% endirim!",
      icon: Icons.ramen_dining,
    ),
    NotificationModel(
      title: "Dadlı dönərlər səni gözləyir! 🔥",
      description:
          "Lavaşda, ədviyyatlı və közdə bişirilmiş dönərlərimizi dadmaq üçün bizə qoşul!",
      icon: Icons.restaurant,
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
