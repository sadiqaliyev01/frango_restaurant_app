import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/extansions/price_parsing.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/product_image.dart';
import 'package:frango_restaurant_app/presentation/screens/product_details/widgets/quantity_selector.dart';
import 'package:frango_restaurant_app/presentation/screens/product_details/quantity_bloc/product_details_cubit.dart';

class ProductDetails extends StatelessWidget {
  final String productName;
  final String description;
  final String price;
  final String imageLink;

  const ProductDetails({
    super.key,
    required this.productName,
    required this.description,
    required this.price,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
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
                style: const TextStyle(
                  color: AppColors.primaryYellow,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  color: AppColors.primaryYellow,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              const SizedBox(height: 24),
              BlocBuilder<ProductDetailsCubit, int>(
                builder: (context, quantity) {
                  double totalPrice = price.toDouble() * quantity;
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: QuantitySelector(
                          quantity: quantity,
                          onIncrement: () =>
                              context.read<ProductDetailsCubit>().increment(),
                          onDecrement: () =>
                              context.read<ProductDetailsCubit>().decrement(),
                        ),
                      ),
                      // const SizedBox(height: 16),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryYellow,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          child: Text(
                            'Sifarişə əlavə et\n${totalPrice.toStringAsFixed(2)} ₼',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
