import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/data/models/remote/meal_response.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_description.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_image.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_name.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_price.dart';
import 'package:frango_restaurant_app/presentation/screens/product_details/product_details.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({
    super.key,
    required this.mealResponse,
    required this.scrollController,
  });

  final ScrollController scrollController;
  final MealResponse mealResponse;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryYellow,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                mealResponse.category?.title ?? 'No Category Name',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                if (mealResponse.id != null) {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    builder: (context) => ProductDetails(
                      id: mealResponse.id!,
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.black,
                    ),
                    child: Row(
                      children: [
                        ProductImage(
                          imageLink: mealResponse.image ?? '',
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              ProductName(
                                productName: mealResponse.title ?? '',
                                style: GoogleFonts.roboto(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ProductDescription(
                                description: mealResponse.description ?? '',
                                style: GoogleFonts.roboto(
                                  color: Colors.yellow,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  ProductPrice(
                                    price: mealResponse.price,
                                    style: GoogleFonts.roboto(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}