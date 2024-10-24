import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/widgets/avatar_image.dart';
import 'package:frango_restaurant_app/presentation/widgets/search_box.dart'; // Arama kutusunu içe aktardık
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_paddings.dart';

class AppBarItems extends StatelessWidget implements PreferredSizeWidget {
  const AppBarItems({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBlack,
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver to",
            style: TextStyle(
              color: AppColors.lightGray,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Babek pr. 95",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
      leading: const Padding(padding: AppPaddings.a4, child: AvatarImage()),
      actions: [
        // Arama kutusunu ortalamak için bir Container içine alıyoruz
        Container(
          alignment: Alignment.center,
          child: const SizedBox(
              width: 150,
              height: 48,
              child: SearchBox()),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: AppColors.primaryYellow),
        ),
      ],
    );
  }
}
