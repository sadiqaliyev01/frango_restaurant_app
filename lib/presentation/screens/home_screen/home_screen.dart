import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/data/models/local/home_screen_scroller_model.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/app_bar_items.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/campaigns.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/menu_items_categories.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/search_box.dart';
import 'package:frango_restaurant_app/presentation/widgets/dot_indicator.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_paddings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreenBody();
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  final ScrollController scrollController = ScrollController();
  final ScrollController categoryScrollController = ScrollController();
  int selectedCategoryIndex = 0;

  final double campaignHeight = 200.0; // Campaigns widget height
  final double searchBoxHeight = 54.0; // SearchBox widget height
  final double categoryHeaderHeight = 0.0; // Category header height
  final double categoryItemHeight = 300.0; // Each category's approximate height

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    categoryScrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    double offset = scrollController.offset;

    // Calculate the adjusted offset based on the height of Campaigns and SearchBox
    double adjustedOffset = offset - (campaignHeight + searchBoxHeight + categoryHeaderHeight);

    // Calculate the positions of the categories
    List<double> categoryPositions = List.generate(
      8,
          (index) => index * categoryItemHeight,
    );

    // Determine which category is in view
    int newIndex = categoryPositions.indexWhere((position) {
      return adjustedOffset >= position && adjustedOffset < position + categoryItemHeight;
    });

    // Update only if the new index is valid and different from the current selected index
    if (newIndex != -1 && newIndex != selectedCategoryIndex) {
      setState(() {
        selectedCategoryIndex = newIndex;
      });

      // Scroll the category headers horizontally
      double categoryWidth = 100.0; // Each category's width
      categoryScrollController.animateTo(
        (newIndex * categoryWidth) - (categoryWidth * 2), // Bring the selected category to the center
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
    scrollController.animateTo(
      campaignHeight + searchBoxHeight + categoryHeaderHeight + index * categoryItemHeight, // Adjusted scroll position
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    // Scroll the category headers horizontally
    double categoryWidth = 100.0; // Each category's width
    categoryScrollController.animateTo(
      index * categoryWidth, // Bring the selected category to the start
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<HomeScreenScrollerModel> scrollerModel = HomeScreenScrollerModel.model;

    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      appBar: const AppBarItems(),
      body: Column(
        children: [
          const Padding(
            padding: AppPaddings.a16,
            child: SearchBox(),
          ),
          MenuItemsCategories(
            selectedIndex: selectedCategoryIndex,
            onCategorySelected: onCategorySelected,
            scrollController: categoryScrollController,
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              children: [
                Campaigns(pageController: pageController),
                Center(
                  child: DotIndicator(
                    pageController: pageController,
                    itemCount: scrollerModel.length,
                    activeDotColor: AppColors.primaryYellow,
                    dotColor: AppColors.white,
                  ),
                ),
                // Content sections
                Container(
                  height: categoryItemHeight,
                  color: Colors.red,
                  child: const Center(child: Text('Doner')),
                ),
                Container(
                  height: categoryItemHeight,
                  color: Colors.blue,
                  child: const Center(child: Text('Pizza')),
                ),
                Container(
                  height: categoryItemHeight,
                  color: Colors.green,
                  child: const Center(child: Text('Taco')),
                ),
                Container(
                  height: categoryItemHeight,
                  color: Colors.yellow,
                  child: const Center(child: Text('Burger')),
                ),
                Container(
                  height: categoryItemHeight,
                  color: Colors.orange,
                  child: const Center(child: Text('Lahmacun')),
                ),
                Container(
                  height: categoryItemHeight,
                  color: Colors.purple,
                  child: const Center(child: Text('Qarnirler')),
                ),
                Container(
                  height: categoryItemHeight,
                  color: Colors.brown,
                  child: const Center(child: Text('Souslar')),
                ),
                Container(
                  height: categoryItemHeight,
                  color: Colors.grey,
                  child: const Center(child: Text('Ickiler')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
