
import 'package:frango_restaurant_app/utils/constants/app_assets.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class OnboardModel {
  const OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  static const List<OnboardModel> onboardItems = [
    OnboardModel(
      image: AppAssets.frangoAntakya,
      title: AppStrings.antakyaSosTitle,
      description: AppStrings.antakyaSosDescription,
    ),
    OnboardModel(
      image: AppAssets.frangoBarbecue,
      title: AppStrings.barbecueSosTitle,
      description: AppStrings.barbecueSosDescription,
    ),
    OnboardModel(
      image: AppAssets.frangoCaciki,
      title: AppStrings.cacikiSosTitle,
      description: AppStrings.cacikiSosDescription,
    ),
    OnboardModel(
      image: AppAssets.frangoGarlic,
      title: AppStrings.garlicSosTitle,
      description: AppStrings.garlicSosDescription,
    ),
    OnboardModel(
      image: AppAssets.frangoHot,
      title: AppStrings.hotSosTitle,
      description: AppStrings.hotSosDescription,
    ),
    OnboardModel(
      image: AppAssets.frangoKokteyl,
      title: AppStrings.kokteylSosTitle,
      description: AppStrings.kokteylSosDescription,
    ),
    OnboardModel(
      image: AppAssets.frangoKori,
      title: AppStrings.koriSosTitle,
      description: AppStrings.koriSosDescription,
    ),
    OnboardModel(
      image: AppAssets.frangoRanch,
      title: AppStrings.ranchSosTitle,
      description: AppStrings.ranchSosDescription,
    ),
  ];
}
