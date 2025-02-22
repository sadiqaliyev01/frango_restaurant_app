import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/data/models/remote/meal_response.dart';
import 'package:frango_restaurant_app/presentation/screens/product_details/product_details.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_name.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_image.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_price.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_description.dart';

class ProductsCard extends StatelessWidget {
  final List<Meal> meals;
  final String categoryTitle;

  const ProductsCard({
    super.key,
    required this.meals,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Card(
      color: AppColors.primaryYellow,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryTitle,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];

                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      builder: (context) => ProductDetails(
                        meal: meal,
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: isLightMode ? Colors.white : AppColors.black,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            ProductImage(
                              imageLink: meal.image ?? "",
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  ProductName(
                                    productName: meal.title ?? "No title",
                                    style: GoogleFonts.roboto(
                                      color: isLightMode
                                          ? Colors.black
                                          : Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Spacer(),
                                  ProductDescription(
                                    description: meal.description ??
                                        "No description available",
                                    style: GoogleFonts.roboto(
                                      color: isLightMode
                                          ? Colors.black
                                          : Colors.yellow,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "Price: ",
                                        style: GoogleFonts.roboto(
                                          color: isLightMode
                                              ? Colors.black
                                              : Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      ProductPrice(
                                        price: meal.price?.toDouble() ?? 0,
                                        style: GoogleFonts.roboto(
                                          color: isLightMode
                                              ? Colors.black
                                              : Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
