import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_cubit.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_state.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/all_products.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/drawer_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/app_bar_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerItems(),
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: const AppBarItems(),
        body: BlocBuilder<MealCubit, MealState>(
          builder: (_, state) {
            if (state is MealLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              );
            } else if (state is MealSuccess) {
              final meals = state.meals;
              final category = state.selectedCategory ?? "Unknown";

              return Column(
                children: [
                  const SizedBox(height: 20),
                  const ProductCategories(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: meals.isEmpty
                        ? Center(
                            child: Text(
                              "No meals available",
                              style: theme.textTheme.bodyLarge,
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
              return Center(
                child: Text(
                  "Meal Failure",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              );
            }
            return Center(
              child: Text(
                "Error",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
