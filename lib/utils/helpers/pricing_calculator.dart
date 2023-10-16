class TPricingCalculator {

  /// -- calculate price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {

    double taxRate = getTaxRateForLocation(location);

    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;

    return totalPrice;
  }

  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice + taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // lookup the tax rate for given location from a tax rate database or API.
    return 0.10; // example tax rate 10%
  }

  static double getShippingCost(String location) {
    // lookup the shipping cost for given location
    // calculate the shipping cost based various factors like distance, weight, etc.
    return 5.0; // example shipping cost $5
  }


}