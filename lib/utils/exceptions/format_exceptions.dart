/// Custom exceptions class to handel various Firebase format-related errors.
class TFormatException implements Exception {
  /// The associated error message.
  final String message;

  /// default constructor with a generic error message.
  TFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);

  /// create a format exception for a special error message
  factory TFormatException.fromMessage(String msg) {
    return TFormatException(msg);
  }

  /// get the corresponding error message
  String get formattedMessage => message;

  /// Get the corresponding error message based on error code.
  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return TFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return TFormatException('The provider phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return TFormatException('The date format invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return TFormatException('The URL format invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return TFormatException('The credit card format invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return TFormatException('The input should be a valid numeric format.');
      // add more case as needed ...
      default:
        return TFormatException('An unexpected Firebase error occurred. Please try again.');
    }
  }

}