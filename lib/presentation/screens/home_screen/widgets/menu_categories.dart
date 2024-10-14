import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/cubits/home/home_state.dart';
import 'package:frango_restaurant_app/data/models/local/menu_categories_data.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCategories extends StatelessWidget {
  final Function(int) onCategorySelected;
  final ScrollController horizontalScrollController;
  final ScrollController verticalScrollController;

  const MenuCategories({
    required this.onCategorySelected,
    required this.horizontalScrollController,
    required this.verticalScrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    List<MenuCategoriesData> categories = MenuCategoriesData.getCategories;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        int selectedIndex = 0;
        if (state is HomeIndexChanged) {
          selectedIndex = state.currentIndex;
        }

        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: horizontalScrollController,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final MenuCategoriesData data = categories[index];
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                onCategorySelected(index);
                cubit.changeIndex(index);
                cubit.jumpToIndex(index, verticalScrollController);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.yellow : Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    data.categoryNames,
                    style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

