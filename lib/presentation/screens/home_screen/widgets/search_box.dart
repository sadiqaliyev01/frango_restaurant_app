import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_radiuses.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.primaryYellow,
      ),
      cursorColor: AppColors.white,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadiuses.a24,
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadiuses.a24,
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        filled: true,
        fillColor: AppColors.grey,
        suffixIconColor: AppColors.primaryYellow,
        suffixIcon: Icon(
          Icons.search,
        ),
        border: OutlineInputBorder(borderRadius: AppRadiuses.a24),
      ),
    );
  }
}
