import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_cubit.dart';
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
      onChanged: (query) {
        context.read<MealCubit>().searchMeals(query); // ✅ Trigger search
      },
      decoration: const InputDecoration(
        hintText: "Axtar",
        hintStyle: TextStyle(
          color: AppColors.primaryYellow,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadiuses.a24,
          borderSide: BorderSide(
            color: AppColors.gray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadiuses.a24,
          borderSide: BorderSide(
            color: AppColors.gray,
          ),
        ),
        filled: true,
        fillColor: AppColors.gray,
        suffixIconColor: AppColors.primaryYellow,
        suffixIcon: Icon(
          Icons.search,
        ),
        border: OutlineInputBorder(borderRadius: AppRadiuses.a24),
      ),
    );
  }
}
