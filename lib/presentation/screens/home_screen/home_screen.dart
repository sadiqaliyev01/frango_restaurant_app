import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/cubits/home/home_state.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/all_products.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/app_bar_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/drawer_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/menu_categories.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController verticalScrollController = ScrollController();
    final ScrollController horizontalScrollController =
        ScrollController(); // Yatay scroll controller
    final cubit = context.read<HomeCubit>();

    verticalScrollController.addListener(() {
      cubit.onVerticalScrollCurrentCategory(verticalScrollController);

      // vertical scroll sirasinda horizontal scrollu synchronize et
      final currentIndex = cubit.state is HomeIndexChanged
          ? (cubit.state as HomeIndexChanged).currentIndex
          : 0;

      // horizontal scrollu update et
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
        body: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 34,
              child: MenuCategories(
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
              child: AllProducts(
                scrollController: verticalScrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
