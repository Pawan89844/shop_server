import 'package:mongo_dart/mongo_dart.dart';
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
    return ProductModel(
        prodName: json['prodName'],
        prodImage: json['prodImage'],
        prodDetails: ProductDetailsModel.fromUser(
            json['prodDetails'], json['prodName']));
  }

  factory ProductModel.fromDB(Map<String, dynamic> json) {
    final id = (json['_id'] as ObjectId).id;
    String objectId = id.hexString;
    return ProductModel(
        id: objectId,
        prodName: json['prodName'],
        prodImage: json['prodImage'],
        prodDetails: ProductDetailsModel.fromDB(json['prodDetails'],
            prodId: objectId, prodName: json['prodName']));
  }

  Map<String, dynamic> toJson() => id == null ? _withoutId() : _withId();

  Map<String, dynamic> _withoutId() => {
        'prodName': prodName,
        'prodImage': prodImage,
        'prodDetails': prodDetails.toJson()
      };

  Map<String, dynamic> _withId() => {
        'prodId': id,
        'prodName': prodName,
        'prodImage': prodImage,
        'prodDetails': prodDetails.jsonForUser()
      };
}
