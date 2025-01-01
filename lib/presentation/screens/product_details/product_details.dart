import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/presentation/screens/manage_payment/manage_payment_methods.dart';
import 'package:frango_restaurant_app/presentation/screens/product_details/widgets/quantity_selector.dart';
import 'package:frango_restaurant_app/cubits/product_details/product_details_cubit.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/price_parsing.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Product ID: $id',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
