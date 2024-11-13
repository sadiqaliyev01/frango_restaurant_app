extension PriceParsing on String {
  double toDouble() {
    String cleanedPrice = replaceAll("₼", "").replaceAll(",", ".").trim();
    return double.tryParse(cleanedPrice) ?? 0.0;
  }
}
