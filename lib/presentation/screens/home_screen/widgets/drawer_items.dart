import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/data/remote/services/local/login_local_service.dart';
import 'package:frango_restaurant_app/utils/di/locator.dart';
import 'package:frango_restaurant_app/utils/helpers/pager.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/data/remote/contractor/about_us_contractor.dart';
import 'package:frango_restaurant_app/presentation/screens/user_profile_screen/user_profile.dart';
import 'package:frango_restaurant_app/presentation/screens/settings_screen/settings_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/list_tile_items.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key});

  AboutUsContractor? get aboutUsRepository => null;

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final drawerBackground = isLight ? AppColors.white : AppColors.primaryBlack;

    return Drawer(
      backgroundColor: drawerBackground,
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
                        builder: (_) => const UserProfile(),
                      ),
                    );
                  },
                ),
                // ListTileItems(
                //   icon: const Icon(
                //     Icons.percent,
                //     color: AppColors.primaryBlack,
                //   ),
                //   text: const Text("Kampaniyalar"),
                //   onTap: () {},
                // ),
                ListTileItems(
                  icon: const Icon(
                    Icons.table_restaurant_sharp,
                    color: AppColors.primaryBlack,
                  ),
                  text: const Text("Rezervasiya"),
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Pager.tables,
                      ),
                    );
                  },
                ),
                ListTileItems(
                  icon: const Icon(
                    Icons.info,
                    color: AppColors.primaryBlack,
                  ),
                  text: const Text("Haqqımızda"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Pager.aboutUs,
                      ),
                    );
                  },
                ),
                ListTileItems(
                  icon: const Icon(
                    Icons.call,
                    color: AppColors.primaryBlack,
                  ),
                  text: const Text("Bizimlə əlaqə"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Pager.contactUs,
                      ),
                    );
                  },
                ),
                ListTileItems(
                  icon: const Icon(
                    Icons.settings,
                    color: AppColors.primaryBlack,
                  ),
                  text: const Text("Tənzimləmələr"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SettingsScreen(),
                      ),
                    );
                  },
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
                  locator<LoginLocalService>().deleteSaveByKey('login');

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Pager.login,
                    ),
                    (route) => false,
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
