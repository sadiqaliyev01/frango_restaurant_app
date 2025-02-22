import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/theme/theme_cubit.dart';
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
            // deleteAccount() metodunu burada çağıra bilersen
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldBgColor = Theme.of(context).scaffoldBackgroundColor;
    final appBarTheme = Theme.of(context).appBarTheme;

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: appBarTheme.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: appBarTheme.iconTheme?.color,
          ),
        ),
        titleSpacing: 105,
        title: Text(
          AppStrings.settings,
          style: appBarTheme.titleTextStyle,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(AppStrings.editProfileText),
            trailing: const Icon(Icons.arrow_forward_ios),
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
            leading: const Icon(Icons.lock),
            title: const Text(AppStrings.resetPassText),
            trailing: const Icon(Icons.arrow_forward_ios),
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
            leading: const Icon(
              Icons.language,
            ),
            title: const Text(AppStrings.languageText),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text(AppStrings.themeText),
            trailing: BlocBuilder<ThemeCubit, bool>(
              builder: (context, isDarkMode) {
                return Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  activeColor: AppColors.primaryYellow,
                  inactiveThumbColor:
                      Colors.grey, // inactive durumda thumb rengi gri
                  inactiveTrackColor:
                      Colors.grey[300], // isteğe bağlı: inactive track rengi
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.block, color: Colors.red),
            title: const Text(
              AppStrings.deleteAccountText,
              style: TextStyle(color: Colors.red),
            ),
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
