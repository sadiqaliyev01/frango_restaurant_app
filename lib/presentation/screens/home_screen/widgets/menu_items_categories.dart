import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class MenuItemsCategories extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onCategorySelected;
  final ScrollController scrollController;

  const MenuItemsCategories({
    super.key,
    required this.selectedIndex,
    required this.onCategorySelected,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Doner',
      'Pizza',
      'Taco',
      'Burger',
      'Lahmacun',
      'Qarnirler',
      'Souslar',
      'Ickiler',
    ];

    return Container(
      height: 50,
      color: Colors.black,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onCategorySelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: Text(
                categories[index],
                style: TextStyle(
                  color: index == selectedIndex
                      ? AppColors.primaryYellow
                      : Colors.white.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
