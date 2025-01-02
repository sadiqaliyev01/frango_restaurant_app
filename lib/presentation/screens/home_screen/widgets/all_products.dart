import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/cubits/home/home_state.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/products_card.dart';

import '../../../../data/models/remote/meal_response.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key,
    required this.scrollController,
    required this.categoryTitle,
    required this.meals});

  final ScrollController scrollController;
  final String categoryTitle;
  final List<MealResponse> meals;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          controller: scrollController,
          children: [
            ProductsCard(categoryTitle: categoryTitle, meals: meals),
          ],
        );
      },
    );
  }
}