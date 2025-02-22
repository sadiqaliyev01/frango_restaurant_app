import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_cubit.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_radiuses.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return TextFormField(
      style: TextStyle(
        color: isLightMode ? Colors.black : AppColors.primaryYellow,
      ),
      cursorColor: isLightMode ? Colors.black : AppColors.white,
      onChanged: (query) {
        context.read<MealCubit>().searchMeals(query);
      },
      decoration: InputDecoration(
        hintText: "Axtar",
        hintStyle: TextStyle(
          color: isLightMode ? Colors.black : AppColors.primaryYellow,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadiuses.a24,
          borderSide: BorderSide(
            color: isLightMode ? Colors.black : AppColors.gray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadiuses.a24,
          borderSide: BorderSide(
            color: isLightMode ? Colors.black : AppColors.gray,
          ),
        ),
        filled: true,
        fillColor: isLightMode ? Colors.white : AppColors.gray,
        suffixIconColor: isLightMode ? Colors.black : AppColors.primaryYellow,
        suffixIcon: const Icon(
          Icons.search,
        ),
        border: const OutlineInputBorder(borderRadius: AppRadiuses.a24),
      ),
    );
  }
}
