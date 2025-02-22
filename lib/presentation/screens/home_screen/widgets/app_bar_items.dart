import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/widgets/search_box.dart';
import 'package:frango_restaurant_app/presentation/screens/notifications/notifications_screen.dart';

class AppBarItems extends StatelessWidget implements PreferredSizeWidget {
  const AppBarItems({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    return AppBar(
      backgroundColor: appBarTheme.backgroundColor,
      elevation: 0,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: appBarTheme.iconTheme?.color,
            ),
          );
        },
      ),
      title: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.6,
        child: const SearchBox(),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const NotificationsScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.notifications,
            color: appBarTheme.iconTheme?.color,
          ),
        ),
      ],
    );
  }
}
