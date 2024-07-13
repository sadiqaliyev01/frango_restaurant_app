import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/data/models/local/home_screen_scroller_model.dart';
import 'package:frango_restaurant_app/utils/constants/app_paddings.dart';
import 'package:frango_restaurant_app/utils/constants/app_radiuses.dart';

class Campaigns extends StatelessWidget {
  const Campaigns({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    List<HomeScreenScrollerModel> scrollerModel = HomeScreenScrollerModel.model;

    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: pageController,
        itemCount: scrollerModel.length,
        itemBuilder: (context, index) {
          final discount = scrollerModel[index];
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: AppPaddings.h10,
                  child: ClipRRect(
                    borderRadius: AppRadiuses.a24,
                    child: Image.asset(
                      discount.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
