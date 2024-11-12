import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/list_tile_items.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/login_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/user_profile_screen/user_profile.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryBlack,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              padding: const EdgeInsets.only(top: 14),
              children: [
                ListTileItems(
                  icon: const Icon(
                    Icons.person,
                    color: AppColors.primaryBlack,
                  ),
                  text: const Text("Hesabım"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const UserProfile();
                        },
                      ),
                    );
                  },
                ),
                ListTileItems(
                  icon: const Icon(
                    Icons.percent,
                    color: AppColors.primaryBlack,
                  ),
                  text: const Text("Kampaniyalar"),
                  onTap: () {},
                ),
                ListTileItems(
                  icon: const Icon(
                    Icons.table_restaurant_sharp,
                    color: AppColors.primaryBlack,
                  ),
                  text: const Text("Rezervasiya"),
                  onTap: () {},
                ),
                ListTileItems(
                  icon: const Icon(
                    Icons.info,
                    color: AppColors.primaryBlack,
                  ),
                  text: const Text("Haqqımızda"),
                  onTap: () {},
                ),
                ListTileItems(
                  icon: const Icon(
                    Icons.call,
                    color: AppColors.primaryBlack,
                  ),
                  text: const Text("Bizimlə əlaqə"),
                  onTap: () {},
                ),
                ListTileItems(
                  icon: const Icon(
                    Icons.settings,
                    color: AppColors.primaryBlack,
                  ),
                  text: const Text("Ayarlar"),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTileItems(
                icon: const Icon(
                  Icons.exit_to_app,
                  color: AppColors.primaryBlack,
                ),
                text: const Text("Çıxış Et"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
