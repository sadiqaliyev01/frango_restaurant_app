import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/data/models/remote/meal_response.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_description.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_image.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_name.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_price.dart';
import 'package:frango_restaurant_app/presentation/screens/product_details/product_details.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsCard extends StatelessWidget {
  final String categoryTitle;
  final List<Meal> meals;

  const ProductsCard({
    super.key,
    required this.categoryTitle,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
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
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index]; // ✅ meal is now correctly a Meal

                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      builder: (context) => ProductDetails(
                        meal: meal, // ✅ Pass Meal directly
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            ProductImage(
                              imageLink: meal.image ?? "",
                            ), // ✅ No need to access meal?.first
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  ProductName(
                                    productName: meal.title ?? "No title",
                                    style: GoogleFonts.roboto(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Spacer(),
                                  ProductDescription(
                                    description: meal.description ??
                                        "No description available",
                                    style: GoogleFonts.roboto(
                                      color: Colors.yellow,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "Price: ",
                                        style: GoogleFonts.roboto(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      ProductPrice(
                                        price: meal.price?.toDouble() ?? 0,
                                        style: GoogleFonts.roboto(
                                          color: Colors.yellow,
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
