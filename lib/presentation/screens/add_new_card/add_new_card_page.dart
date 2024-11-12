import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/add_new_card/widgets/custom_enter_new_card.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class AddNewCardPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  AddNewCardPage({super.key});

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
          centerTitle: true,
          title: const Text(
            'Add New Card',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  AppStrings.addCardPageTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColors.primaryYellow.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 25.0),
                CustomTextField(
                  label: 'Card Number',
                  hint: '1234 5678 9012 3456',
                  maxLength: 16,
                  keyboardType: TextInputType.number,
                  controller: cardNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter card number';
                    } else if (value.length != 16) {
                      return 'Card number must be 16 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                CustomTextField(
                  label: 'Card Holder Name',
                  hint: 'Your Name',
                  maxLength: 30,
                  keyboardType: TextInputType.name,
                  controller: cardHolderNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter card holder name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'Expiry Date',
                        hint: 'MM/YY',
                        maxLength: 5,
                        keyboardType: TextInputType.datetime,
                        controller: expiryDateController,
                        isExpiryDate: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter expiry date';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: CustomTextField(
                        label: 'CVV',
                        hint: '123',
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        controller: cvvController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter CVV';
                          } else if (value.length != 3) {
                            return 'CVV must be 3 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newCardNumber = cardNumberController.text;
                        Navigator.pop(context, newCardNumber);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Card Added Successfully'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryYellow,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Add Card',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
