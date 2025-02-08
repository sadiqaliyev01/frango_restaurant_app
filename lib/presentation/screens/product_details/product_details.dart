import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/data/models/remote/meal_response.dart';
import 'package:frango_restaurant_app/presentation/screens/manage_payment/manage_payment_screen.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/presentation/screens/product_details/widgets/quantity_selector.dart';

import '../../../cubits/product_details/product_details_cubit.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.meal,
  });

  final Meal meal; // ✅ Change from MealResponse to Meal

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(22)),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      meal.image ?? "no image", // ✅ Directly use meal.image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.title ?? "No product title",
                        style: const TextStyle(
                          color: AppColors.primaryYellow,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        meal.description ?? "No product description",
                        style: const TextStyle(
                          color: AppColors.primaryYellow,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      BlocBuilder<ProductDetailsCubit, int>(
                        builder: (context, quantity) {
                          double totalPrice =
                              (meal.price?.toDouble() ?? 0) * quantity;
                          return Row(
                            children: [
                              QuantitySelector(
                                quantity: quantity,
                                onIncrement: () => context
                                    .read<ProductDetailsCubit>()
                                    .increment(),
                                onDecrement: () => context
                                    .read<ProductDetailsCubit>()
                                    .decrement(),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ManagePaymentScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryYellow,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                child: Text(
                                  'Sifarişə əlavə et\n${totalPrice.toStringAsFixed(2)} ₼',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.black,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
