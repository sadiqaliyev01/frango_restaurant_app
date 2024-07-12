import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/data/models/local/home_screen_scroller_model.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/campaigns.dart';
import 'package:frango_restaurant_app/presentation/widgets/dot_indicator.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeScreenScrollerModel> scrollerModel = HomeScreenScrollerModel.model;
    final PageController pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );

    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlack,
        foregroundColor: AppColors.primaryYellow,
        title: const Text('Frango - Döner Sosla Yenir!'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Campaigns(pageController: pageController),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DotIndicator(
              pageController: pageController,
              itemCount: scrollerModel.length,
            ),
          ),
        ],
      ),
    );
  }
}
