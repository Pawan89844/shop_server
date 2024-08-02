class ProductDetailsModel {
  final String? prodId;
  final String? prodName;
  final String description;
  final List<String> prodImages;
  final bool isInStock;
  final double rating;
  final double reviews;
  final List<String> availableSizes;
  final double price;

  ProductDetailsModel(
      {this.prodId,
      this.prodName,
      required this.description,
      required this.prodImages,
      required this.isInStock,
      required this.rating,
      required this.reviews,
      required this.availableSizes,
      required this.price});

  factory ProductDetailsModel.fromUser(
      Map<String, dynamic> json, String prodName) {
    // print('Json: $json');
    return ProductDetailsModel(
        description: json['description'],
        prodImages: List<String>.from(json['prodImages']),
        isInStock: json['isInStock'],
        rating: json['rating'] is int
            ? double.parse(json['rating'].toString())
            : json['rating'],
        reviews: json['reviews'] is int
            ? double.parse(json['reviews'].toString())
            : json['reviews'],
        availableSizes: List.from(json['availableSizes']),
        price: json['price']);
  }
  factory ProductDetailsModel.fromDB(Map<String, dynamic> json,
      {required String prodId, required String prodName}) {
    // print('Json: $json');
    return ProductDetailsModel(
        prodId: prodId,
        prodName: prodName,
        description: json['description'],
        prodImages: List<String>.from(json['prodImages']),
        isInStock: json['isInStock'],
        rating: json['rating'] is int
            ? double.parse(json['rating'].toString())
            : json['rating'],
        reviews: json['reviews'] is int
            ? double.parse(json['reviews'].toString())
            : json['reviews'],
        availableSizes: List.from(json['availableSizes']),
        price: json['price']);
  }

  Map<String, dynamic> jsonForUser() => {
        'prodId': prodId,
        'prodName': prodName,
        'description': description,
        'prodImages': prodImages,
        'isInStock': isInStock,
        'rating': rating,
        'reviews': reviews,
        'availableSizes': availableSizes,
        'price': price
      };

  Map<String, dynamic> toJson() => {
        'description': description,
        'prodImages': prodImages,
        'isInStock': isInStock,
        'rating': rating,
        'reviews': reviews,
        'availableSizes': availableSizes,
        'price': price
      };
}
