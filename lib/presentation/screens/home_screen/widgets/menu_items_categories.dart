import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/data/models/local/menu_items_model.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/menu_categories_buttons.dart';
import 'package:frango_restaurant_app/utils/constants/app_paddings.dart';

class MenuItemsCategories extends StatelessWidget {
  const MenuItemsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItemsModel> menuItems = MenuItemsModel.menuItemsNames;

    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: menuItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Row(
            children: [
              Padding(
                padding: AppPaddings.h10,
                child: MenuCategoriesButtons(
                  foodName: item.foodName,
                  onTap: () {},
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
