import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/add_button.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_image.dart';

class ProductDetails extends StatelessWidget {
  final String productName;
  final String imageLink;
  final String description;
  final String price;

  const ProductDetails({
    super.key,
    required this.productName,
    required this.imageLink,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      appBar: AppBar(
        title: Text(
          productName,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryYellow,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ProductImage(imageLink: imageLink),
            ),
            const SizedBox(height: 24),
            Text(
              productName,
              style: GoogleFonts.roboto(
                color: AppColors.primaryYellow,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: GoogleFonts.roboto(
                color: AppColors.primaryYellow,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              price,
              style: GoogleFonts.roboto(
                color: AppColors.primaryYellow,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: AddButton(),
            ),
          ],
        ),
      ),
    );
  }
}
