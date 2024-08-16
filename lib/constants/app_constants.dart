class AppString {
  static const String dbUrl = 'mongodb://localhost:27017/shop';

  static const String POST = 'POST';
  static const String GET = 'GET';
  static const Map<String, Object> defaultHeader = {
    'content-type': 'application/json'
  };

  // PRODUCTS

  static const String productAdded = 'Product Successfully added';
  static const String productFailed = 'Oops! Something went wrong';
  static const String cartProductAdded = 'Product Successfully added to cart';

  /// Bad Request error
  static String badRequest(String method) =>
      'Oops! Request METHOD is incorrect, try calling $method';

  /// DB Collections
  static const String PRODUCT = 'Products';
  static const String CART = 'Cart';
}
