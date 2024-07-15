import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/data/models/local/onboard_model.dart';
import 'package:frango_restaurant_app/presentation/screens/onboard_screen/widgets/onboard_description_and_style.dart';
import 'package:frango_restaurant_app/presentation/screens/onboard_screen/widgets/onboard_title_and_style.dart';

class PageViewBuilder extends StatelessWidget {
  const PageViewBuilder({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    List<OnboardModel> onboards = OnboardModel.onboardItems;

    return PageView.builder(
      controller: pageController,
      itemCount: onboards.length,
      itemBuilder: (context, index) {
        final items = onboards[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  items.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            OnboardTitleAndStyle(
              title: items.title,
            ),
            const SizedBox(height: 20),
            OnboardDescriptionAndStyle(
              description: items.description,
            ),
          ],
        );
      },
    );
  }
}
