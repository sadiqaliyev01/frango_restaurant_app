import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.primaryBlack,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryBlack,
    iconTheme: IconThemeData(color: AppColors.primaryYellow),
    titleTextStyle: TextStyle(color: AppColors.lightGray, fontSize: 20),
  ),
  listTileTheme: const ListTileThemeData(
    textColor: AppColors.primaryYellow,
    iconColor: AppColors.primaryYellow,
  ),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryYellow,
    secondary: AppColors.primaryYellow,
    surface: AppColors.gray,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.primaryYellow),
    trackColor:
        WidgetStateProperty.all(AppColors.primaryYellow.withOpacity(0.5)),
  ),
);

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    iconTheme: IconThemeData(color: AppColors.primaryBlack),
    titleTextStyle: TextStyle(color: AppColors.black, fontSize: 20),
  ),
  listTileTheme: const ListTileThemeData(
    textColor: AppColors.black,
    iconColor: AppColors.primaryBlack,
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryYellow,
    secondary: AppColors.primaryYellow,
    surface: AppColors.buttonAndTextFieldGray,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.primaryYellow),
    trackColor:
        WidgetStateProperty.all(AppColors.primaryYellow.withOpacity(0.5)),
  ),
);
