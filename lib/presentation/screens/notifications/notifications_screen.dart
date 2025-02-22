import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          titleSpacing: 90,
          backgroundColor: theme.appBarTheme.backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: theme.appBarTheme.iconTheme?.color,
            ),
          ),
          title: Text(
            AppStrings.notificationsPageText,
            style: theme.appBarTheme.titleTextStyle,
          ),
        ),
        body: Center(
          child: Text(
            'No notifications right now',
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
