import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/screens/manage_payment/widgets/upi_payment.dart';
import 'package:frango_restaurant_app/presentation/screens/manage_payment/widgets/payment_method_card_banner.dart';

class ManagePaymentMethods extends StatelessWidget {
  const ManagePaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBlack,
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlack,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          centerTitle: true,
          title: const Text(
            AppStrings.managePaymentMethodsText,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.creditAndDebitText,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 20),
              CustomCardPaymentBanner(
                cardNumbers: [
                  '4111 1111 1111 1111',
                  '5111 1111 1111 1111',
                ],
              ),
              SizedBox(height: 20),
              Text(
                AppStrings.upi,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 20),
              CustomUPIPaymentBanner(
                upiMethods: [
                  AppStrings.googlePayText,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
