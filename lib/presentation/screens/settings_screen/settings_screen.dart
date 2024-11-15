import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/screens/settings_screen/reset_pass_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/settings_screen/edit_profile_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/settings_screen/widgets/settings_alert_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SettingsAlertDialog(
          title: AppStrings.warningDialog,
          content: AppStrings.warningText,
          onConfirm: () {
            // deleteAccount(); adlı funksiya yaradıb burada çağıra bilersen
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlack,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.primaryYellow),
        ),
        titleSpacing: 105,
        title: const Text(
          AppStrings.settings,
          style: TextStyle(color: AppColors.lightGray),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person, color: AppColors.primaryYellow),
            title: const Text(AppStrings.editProfileText,
                style: TextStyle(color: AppColors.primaryYellow)),
            trailing: const Icon(Icons.arrow_forward_ios,
                color: AppColors.primaryYellow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditUserProfile(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: AppColors.primaryYellow),
            title: const Text(AppStrings.resetPassText,
                style: TextStyle(color: AppColors.primaryYellow)),
            trailing: const Icon(Icons.arrow_forward_ios,
                color: AppColors.primaryYellow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResetPasswordScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.language, color: AppColors.primaryYellow),
            title: const Text(AppStrings.languageText,
                style: TextStyle(color: AppColors.primaryYellow)),
            trailing: const Icon(Icons.arrow_forward_ios,
                color: AppColors.primaryYellow),
            onTap: () {},
          ),
          ListTile(
            leading:
                const Icon(Icons.notifications, color: AppColors.primaryYellow),
            title: const Text(AppStrings.themeText,
                style: TextStyle(color: AppColors.primaryYellow)),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: AppColors.primaryYellow,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.block, color: Colors.red),
            title: const Text(AppStrings.deleteAccountText,
                style: TextStyle(color: Colors.red)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red),
            onTap: () {
              _showDeleteAccountDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
