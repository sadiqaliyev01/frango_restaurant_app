import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/notifications/notifications_screen.dart';
import 'package:frango_restaurant_app/presentation/widgets/search_box.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class AppBarItems extends StatelessWidget implements PreferredSizeWidget {
  const AppBarItems({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBlack,
      elevation: 0, // ✅ Remove shadow
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: AppColors.primaryYellow,
            ),
          );
        },
      ),
      title: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.6, // ✅ Limit width
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
          icon: const Icon(
            Icons.notifications,
            color: AppColors.primaryYellow,
          ),
        ),
      ],
    );
  }
}
