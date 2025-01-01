import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/category_names/category_names_cubit.dart';
import 'package:frango_restaurant_app/cubits/category_names/category_names_state.dart';
import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/cubits/home/home_state.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCategories extends StatelessWidget {
  final Function(int) onCategorySelected;
  final ScrollController horizontalScrollController;
  final ScrollController verticalScrollController;

  const ProductCategories({
    required this.onCategorySelected,
    required this.horizontalScrollController,
    required this.verticalScrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return BlocBuilder<CategoryNamesCubit, CategoryNamesState>(
      builder: (context, categoryState) {
        if (categoryState is CategoryNamesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (categoryState is CategoryNamesSuccess) {
          final categories =
              categoryState.categoryNamesResponse.map((categoryName) {
            return categoryName.title ?? "No Category";
          }).toList();

          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, homeState) {
              int selectedIndex = 0;
              if (homeState is HomeIndexChanged) {
                selectedIndex = homeState.currentIndex;
              }

              log("categories length: ${categories.length.toString()}");

              return ListView.builder(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: horizontalScrollController,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final categoryTitle = categories[index];
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      onCategorySelected(index);
                      homeCubit.changeIndex(index);
                      homeCubit.jumpToIndex(
                        index,
                        verticalScrollController,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryYellow
                            : AppColors.primaryBlack,
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
              );
            },
          );
        } else if (categoryState is CategoryNamesFailure) {
          log("Error:${categoryState.error}");
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
