import 'package:flutter/services.dart';

extension PhoneNumberFormatter on String {
  String toFullPhoneNumber({String countryCode = "+994"}) {
    final sanitizedInput = replaceAll(RegExp(r'[^0-9]'), '');
    return "$countryCode$sanitizedInput";
  }
}

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final sanitizedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    return TextEditingValue(
      text: sanitizedText,
      selection: TextSelection.collapsed(offset: sanitizedText.length),
    );
  }
}
