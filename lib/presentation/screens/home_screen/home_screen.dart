import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_cubit.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_state.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/all_products.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/app_bar_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/drawer_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerItems(),
        backgroundColor: AppColors.primaryBlack,
        appBar: const AppBarItems(),
        body: BlocBuilder<MealCubit, MealState>(
          builder: (_, state) {
            if (state is MealLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryYellow,
                ),
              );
            } else if (state is MealSuccess) {
              final meals = state.meals;
              final category = state.selectedCategory ?? "Unknown";

              return Column(
                children: [
                  const SizedBox(height: 20),

                  /// ✅ Category Selection Bar
                  const ProductCategories(),

                  const SizedBox(height: 20),

                  /// ✅ Meals of Selected Category
                  Expanded(
                    child: meals.isEmpty
                        ? const Center(
                            child: Text(
                              "No meals available",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : AllProducts(
                            categoryTitle: category,
                            meals: meals,
                          ),
                  ),
                ],
              );
            } else if (state is MealFailure) {
              log("Meal failure: ${state.error}");
              return const Center(
                child: Text(
                  "Meal Failure",
                  style: TextStyle(color: AppColors.primaryYellow),
                ),
              );
            }
            return const Center(
              child: Text(
                "Error",
                style: TextStyle(color: AppColors.primaryYellow),
              ),
            );
          },
        ),
      ),
    );
  }
}
