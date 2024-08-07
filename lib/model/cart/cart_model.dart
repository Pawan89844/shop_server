import '../product/product_details_model.dart';

class CartModel {
  final String cartId;
  final ProductDetailsModel prodDetails;

  CartModel({required this.cartId, required this.prodDetails});

  // factory CartModel.fromDB(Map<String, dynamic> json,
  //     {required String prodId, required String prodName}) {
  //   return CartModel(
  //       cartId: json['cartId'],
  //       prodDetails: ProductDetailsModel.fromDB(json,
  //           prodId: prodId, prodName: prodName));
  // }

  Map<String, dynamic> toJSON() => {
        'cartId': cartId,
        'prodDetails': prodDetails.jsonForUser(),
      };
}
