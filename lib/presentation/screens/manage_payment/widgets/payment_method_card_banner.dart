import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class CustomCardPaymentBanner extends StatelessWidget {
  final List<String> cardNumbers;
  final Function onAddCardPressed;
  final int selectedIndex;
  final Function(int) onCardSelected;

  const CustomCardPaymentBanner({
    super.key,
    required this.cardNumbers,
    required this.onAddCardPressed,
    required this.selectedIndex,
    required this.onCardSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBackground = isDark ? Colors.grey[900] : Colors.white;
    final borderColor = isDark ? Colors.transparent : Colors.black;
    final textColor = isDark ? Colors.white : Colors.black;
    final iconColor = isDark ? Colors.white : Colors.black;
    final dividerColor = isDark ? AppColors.gray : Colors.black;

    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: isDark ? null : Border.all(color: borderColor),
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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cardNumbers.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: index,
                        groupValue: selectedIndex,
                        onChanged: (value) {
                          onCardSelected(index);
                        },
                        activeColor: iconColor,
                      ),
                      _buildCardLogo(cardNumbers[index]),
                      const SizedBox(width: 10.0),
                      Text(
                        _obfuscateCardNumber(cardNumbers[index]),
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                ],
              );
            },
          ),
          Divider(color: dividerColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => onAddCardPressed(),
                icon: Icon(Icons.add_circle, color: iconColor),
                iconSize: 30,
              ),
              TextButton.icon(
                onPressed: () => onAddCardPressed(),
                label: Text(
                  AppStrings.addNewCardText,
                  style: TextStyle(color: textColor),
                ),
              ),
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
      return const SizedBox(width: 40, height: 40);
    }
  }

  String _obfuscateCardNumber(String cardNumber) {
    if (cardNumber.length > 4) {
      return '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
    }
    return cardNumber;
  }
}
