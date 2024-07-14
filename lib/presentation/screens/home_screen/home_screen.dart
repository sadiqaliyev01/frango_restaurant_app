import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/data/models/local/home_screen_scroller_model.dart';
import 'package:frango_restaurant_app/data/models/local/menu_items_model.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/app_bar_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/campaigns.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/menu_items_categories.dart';
import 'package:frango_restaurant_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:frango_restaurant_app/presentation/widgets/dot_indicator.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_paddings.dart';
import 'package:frango_restaurant_app/utils/constants/app_radiuses.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItemsModel> menuItems = MenuItemsModel.menuItemsNames;
    List<HomeScreenScrollerModel> scrollerModel = HomeScreenScrollerModel.model;
    final PageController pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );

    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      appBar: const AppBarItems(),
      body: ListView(
        children: [
          Padding(
            padding: AppPaddings.a16,
            child: TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: AppColors.grey,
                suffixIconColor: AppColors.primaryYellow,
                suffixIcon: Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(borderRadius: AppRadiuses.a24),
              ),
            ),
          ),
          Campaigns(pageController: pageController),
          Center(
            child: DotIndicator(
              pageController: pageController,
              itemCount: scrollerModel.length,
              activeDotColor: AppColors.primaryYellow,
              dotColor: AppColors.white,
            ),
          ),
          const MenuItemsCategories(),
        ],
      ),
    );
  }
}
