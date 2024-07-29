class AppString {
  static const String dbUrl = 'mongodb://localhost:27017/shop';

  static const String POST = 'POST';
  static const Map<String, Object> defaultHeader = {
    'content-type': 'application/json'
  };

  // PRODUCTS

  static const String productAdded = 'Product Successfully added to cart';
  static const String productFailed = 'Oops! Something went wrong';

  /// Bad Request error
  static const String badRequest =
      'Oops! Request METHOD is incorrect, try calling POST';
}
