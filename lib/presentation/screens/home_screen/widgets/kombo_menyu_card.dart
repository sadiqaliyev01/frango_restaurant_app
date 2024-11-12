import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/data/models/local/kombo_menyu_data.dart';
import 'package:frango_restaurant_app/presentation/screens/product_details/product_details.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_name.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_price.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_image.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_description.dart';

class KomboMenyuCard extends StatelessWidget {
  const KomboMenyuCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<KomboMenyuData> komboMenyuData = KomboMenyuData.getKomboMenyuData;
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
                "KOMBO MENYU",
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
            child: ListView.builder(
              itemCount: komboMenyuData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final data = komboMenyuData[index];
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      // isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      builder: (context) => ProductDetails(
                        productName: data.name,
                        imageLink:
                            'assets/frango_images/image_${index + 23}.jpg',
                        description: data.description,
                        price: data.price,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.black,
                      ),
                      child: Row(
                        children: [
                          ProductImage(
                            imageLink:
                                'assets/frango_images/image_${index + 23}.jpg',
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12),
                                ProductName(
                                  productName: data.name,
                                  style: GoogleFonts.roboto(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ProductDescription(
                                  description: data.description,
                                  style: GoogleFonts.roboto(
                                    color: Colors.yellow,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Expanded(
                                  child: Row(
                                    children: [
                                      ProductPrice(
                                        price: data.price,
                                        style: GoogleFonts.roboto(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
