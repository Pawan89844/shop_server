import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shop_server/constants/app_constants.dart';
import 'package:shop_server/handler/products/get_products.dart';
import 'package:shop_server/service/db_service.dart';

import '../../model/cart/cart_model.dart';

class AddCart {
  final DBService _service = DBService();
  final Request request;

  AddCart(this.request);

  List<CartModel> _cart = [];

  void addProduct() async {
    final reqUser = await request.readAsString();
    final jsonDe = jsonDecode(reqUser);
    await _service.initialize();
    if (_service.db.isConnected) {
      final products = await GetProducts(request).products;
      final fetchedProd = products
          .firstWhere((prod) => prod.prodDetails.prodId == jsonDe['prodId']);
      final cart =
          CartModel(cartId: '1', prodDetails: fetchedProd.prodDetails).toJSON();
      await _service.db.collection(AppString.CART).insert(cart);
    }
  }
}
