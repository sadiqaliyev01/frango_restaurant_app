import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/provider/notification_provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  Widget _buildDismissBackground(Alignment alignment) {
    return Container(
      color: Colors.red,
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (_) => NotificationProvider(),
      child: Consumer<NotificationProvider>(
        builder: (context, notificationProvider, child) {
          final notifications = notificationProvider.notifications;
          return SafeArea(
            child: Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              appBar: AppBar(
                titleSpacing: 90,
                backgroundColor: theme.appBarTheme.backgroundColor,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
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
              body: notifications.isEmpty
                  ? Center(
                      child: Text(
                        'Heç bir bildirim yoxdur',
                        style: theme.textTheme.bodyMedium,
                      ),
                    )
                  : ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) =>
                              notificationProvider.removeNotificationAt(index),
                          background:
                              _buildDismissBackground(Alignment.centerLeft),
                          secondaryBackground:
                              _buildDismissBackground(Alignment.centerRight),
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            color: theme.brightness == Brightness.dark
                                ? Colors.grey[900]
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.grey[900]!
                                    : Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.campaign,
                                      size: 28,
                                      color: theme.brightness == Brightness.dark
                                          ? AppColors.primaryYellow
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          notification.title,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: theme.brightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          notification.description,
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: theme.brightness ==
                                                    Brightness.dark
                                                ? Colors.white70
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    notification.icon,
                                    size: 32,
                                    color: theme.brightness == Brightness.dark
                                        ? AppColors.primaryYellow
                                        : Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
