class ProductModel {
  final String prodName;
  final String prodImage;

  ProductModel({required this.prodName, required this.prodImage});

  factory ProductModel.fromUser(Map<String, dynamic> json) {
    return ProductModel(
        prodName: json['prodName'], prodImage: json['prodImage']);
  }

  Map<String, dynamic> toJson() =>
      {'prodName': prodName, 'prodImage': prodImage};
}
