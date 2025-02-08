import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_cubit.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_state.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MealSuccess) {
          final categories = state.categories;
          final selectedCategory = state.selectedCategory;

          return SizedBox(
            height: 40, // Fixed height for categories
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final categoryTitle = categories[index];
                final isSelected = selectedCategory == categoryTitle;

                return GestureDetector(
                  onTap: () {
                    context.read<MealCubit>().filterMealsByCategory(categoryTitle);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primaryYellow : AppColors.primaryBlack,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        categoryTitle,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is MealFailure) {
          log("Error:${state.error}");
          return const Center(
            child: Text(
              "Error: Category Names Failure",
              style: TextStyle(color: AppColors.primaryYellow),
            ),
          );
        }
        return const Center(child: Text("No Data Available"));
      },
    );
  }
}
