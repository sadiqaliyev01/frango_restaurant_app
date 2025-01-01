import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/add_new_card/add_new_card_page.dart';
import 'package:frango_restaurant_app/presentation/screens/manage_payment/widgets/payment_method_card_banner.dart';
import 'package:frango_restaurant_app/presentation/screens/manage_payment/widgets/upi_payment.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class ManagePaymentMethods extends StatefulWidget {
  const ManagePaymentMethods({super.key});

  @override
  State<ManagePaymentMethods> createState() => _ManagePaymentMethodsState();
}

class _ManagePaymentMethodsState extends State<ManagePaymentMethods> {
  List<String> cardNumbers = [
    '4111 1111 1111 1111',
    '5111 1111 1111 1111',
  ];
  int selectedIndex = 0;
  int selectedUPIIndex = -1;

  void _addNewCard(String cardNumber) {
    setState(() {
      cardNumbers.add(cardNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBlack,
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlack,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          title: const Text(
            AppStrings.managePaymentMethodsText,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.creditAndDebitText,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 20),
              CustomCardPaymentBanner(
                cardNumbers: cardNumbers,
                selectedIndex: selectedIndex,
                onCardSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                onAddCardPressed: () async {
                  final newCardNumber = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNewCardPage(),
                    ),
                  );
                  if (newCardNumber != null) {
                    _addNewCard(newCardNumber);
                  }
                },
              ),
              const Text(
                AppStrings.upi,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
              CustomUPIPaymentBanner(
                selectedIndex: selectedUPIIndex,
                onSelected: (index) {
                  setState(() {
                    selectedUPIIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
