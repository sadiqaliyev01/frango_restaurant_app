import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class CustomCardPaymentBanner extends StatelessWidget {
  final List<String> cardNumbers;

  const CustomCardPaymentBanner({
    super.key,
    required this.cardNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var cardNumber in cardNumbers) ...[
            Row(
              children: [
                _buildCardLogo(cardNumber),
                const SizedBox(width: 10.0),
                Text(
                  _obfuscateCardNumber(cardNumber),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
          const Divider(color: AppColors.gray),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle, color: Colors.white),
                iconSize: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  log("add card button pressed");
                },
                label: const Text(
                  AppStrings.addNewCardText,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardLogo(String cardNumber) {
    if (cardNumber.startsWith('4')) {
      return Image.asset(
        'assets/png/visa_card.png',
        width: 40,
        height: 40,
      );
    } else if (cardNumber.startsWith('5')) {
      return Image.asset(
        'assets/png/mastercard_logo.png',
        width: 40,
        height: 40,
      );
    } else {
      return Container(width: 40, height: 40);
    }
  }

  String _obfuscateCardNumber(String cardNumber) {
    if (cardNumber.length > 4) {
      return '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
    }
    return cardNumber;
  }
}
