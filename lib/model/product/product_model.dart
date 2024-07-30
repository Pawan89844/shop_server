import 'package:shop_server/model/product/product_details_model.dart';

class ProductModel {
  final String? id;
  final String prodName;
  final String prodImage;
  final ProductDetailsModel prodDetails;

  ProductModel(
      {this.id,
      required this.prodName,
      required this.prodImage,
      required this.prodDetails});

  factory ProductModel.fromUser(Map<String, dynamic> json) {
    print('Object Id: ${json['_id'].toString().runtimeType}');
    return ProductModel(
        id: json['_id'].toString(),
        prodName: json['prodName'],
        prodImage: json['prodImage'],
        prodDetails: ProductDetailsModel.fromDB(json['prodDetails']));
  }

  Map<String, dynamic> toJson() => {
        'prodName': prodName,
        'prodImage': prodImage,
        'prodDetails': prodDetails.toJson()
      };
}
