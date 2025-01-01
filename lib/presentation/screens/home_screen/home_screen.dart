import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/cubits/home/home_state.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_cubit.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_state.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/app_bar_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/drawer_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_categories.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/products.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

import '../../../data/models/remote/meal_response.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController verticalScrollController = ScrollController();
    final ScrollController horizontalScrollController = ScrollController();

    final cubit = context.read<HomeCubit>();

    verticalScrollController.addListener(() {
      cubit.onVerticalScrollCurrentCategory(verticalScrollController);

      // Synchronize horizontal scroll with vertical scroll
      final currentIndex = cubit.state is HomeIndexChanged
          ? (cubit.state as HomeIndexChanged).currentIndex
          : 0;

      // Update horizontal scroll
      final offset = cubit.calculateScrollOffset(currentIndex);
      horizontalScrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    });

    return SafeArea(
      child: Scaffold(
        drawer: const DrawerItems(),
        backgroundColor: AppColors.primaryBlack,
        appBar: const AppBarItems(),
        body: BlocBuilder<MealCubit, MealState>(
          builder: (context, state) {
            if (state is MealLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryYellow,
              ));
            } else if (state is MealSuccess) {
              final meals = state.mealResponse;

              // Group meals by category
              final groupedMeals = groupMealsByCategory(meals);

              return Column(
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 34,
                    child: ProductCategories(
                      onCategorySelected: (index) {
                        cubit.changeIndex(index);
                        cubit.jumpToIndex(index, verticalScrollController);
                      },
                      horizontalScrollController: horizontalScrollController,
                      verticalScrollController: verticalScrollController,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: groupedMeals.keys.length,
                      itemBuilder: (context, index) {
                        final categoryTitle =
                            groupedMeals.keys.elementAt(index);
                        final categoryMeals = groupedMeals[categoryTitle]!;

                        return Products(
                          categoryTitle: categoryTitle,
                          meals: categoryMeals,
                          scrollController: verticalScrollController,
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is MealFailure) {
              log("Meal failure: ${state.error}");
              return const Text(
                "Meal Failure",
                style: TextStyle(color: AppColors.primaryYellow),
              );
            }
            return const Text(
              "Error",
              style: TextStyle(color: AppColors.primaryYellow),
            );
          },
        ),
      ),
    );
  }

  Map<String, List<MealResponse>> groupMealsByCategory(
      List<MealResponse> meals) {
    Map<String, List<MealResponse>> groupedMeals = {};

    for (var meal in meals) {
      final categoryTitle = meal.category?.title ?? "No Category";
      if (groupedMeals.containsKey(categoryTitle)) {
        groupedMeals[categoryTitle]!.add(meal);
      } else {
        groupedMeals[categoryTitle] = [meal];
      }
    }

    return groupedMeals;
  }
}
