import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_cubit.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_state.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/all_products.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/app_bar_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/drawer_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_categories.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController verticalScrollController = ScrollController();
    final ScrollController horizontalScrollController = ScrollController();

    final homeCubit = context.read<HomeCubit>();
    final mealCubit = context.read<MealCubit>();

    // verticalScrollController.addListener(() {
    //   homeCubit.onVerticalScrollCurrentCategory(verticalScrollController);
    // });

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
                ),
              );
            } else if (state is MealSuccess) {
              final meals = state.mealResponse;
              final groupedMeals = mealCubit.groupMealsByCategory(meals);

              return Column(
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 34,
                    child: ProductCategories(
                      onCategorySelected: (index) {
                        homeCubit.changeIndex(index);
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          homeCubit.jumpToIndex(
                              index, verticalScrollController);
                        });
                      },
                      horizontalScrollController: horizontalScrollController,
                      verticalScrollController: verticalScrollController,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      controller: verticalScrollController,
                      itemCount: groupedMeals.keys.length,
                      itemBuilder: (context, index) {
                        final categoryTitle =
                        groupedMeals.keys.elementAt(index);
                        final categoryMeals = groupedMeals[categoryTitle]!;

                        return AllProducts(
                          scrollController: verticalScrollController,
                          categoryTitle: categoryTitle,
                          meals: categoryMeals,
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
}