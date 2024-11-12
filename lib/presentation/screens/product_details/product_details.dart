import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/extansions/price_parsing.dart';
import 'package:frango_restaurant_app/presentation/screens/manage_payment/manage_payment_methods.dart';
import 'package:frango_restaurant_app/presentation/screens/product_details/widgets/quantity_selector.dart';
import 'package:frango_restaurant_app/cubits/product_details/product_details_cubit.dart';

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
                    child: Image.asset(
                      imageLink,
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
                      const SizedBox(height: 24),
                      BlocBuilder<ProductDetailsCubit, int>(
                        builder: (context, quantity) {
                          double totalPrice = price.toDouble() * quantity;
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
                                            const ManagePaymentMethods()),
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
