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

  Future<dynamic> _userInput() async {
    final reqUser = await request.readAsString();
    final jsonDe = jsonDecode(reqUser);
    return jsonDe;
  }

  String _message(bool isSuccess, dynamic message) {
    return JsonEncoder.withIndent('  ')
        .convert({'status': isSuccess, 'message': message});
  }

  Response _isSuccess(Map<String, dynamic>? isSuccess) {
    if (isSuccess != null) {
      return Response.ok(_message(true, AppString.cartProductAdded),
          headers: AppString.defaultHeader);
    } else {
      return Response.ok(_message(true, AppString.productFailed),
          headers: AppString.defaultHeader);
    }
  }

  Future<Map<String, dynamic>> _getProduct() async {
    final jsonDe = await _userInput();
    final products = await GetProducts(request).products;
    final fetchedProd = products
        .firstWhere((prod) => prod.prodDetails.prodId == jsonDe['prodId']);
    final cart = CartModel(cartId: '1', prodDetails: fetchedProd.prodDetails);
    final cartJson = cart.toJSON();
    return cartJson;
  }

  Future<Map<String, dynamic>?> _openDB() async {
    await _service.initialize();
    if (_service.db.isConnected) {
      final cart = await _getProduct();
      return await _service.db.collection(AppString.CART).insert(cart);
    } else {
      return null;
    }
  }

  Future<Response> addProduct() async {
    if (request.method == AppString.POST) {
      final isSuccess = await _openDB();
      return _isSuccess(isSuccess);
    } else {
      final message = AppString.badRequest(AppString.POST);
      return Response.badRequest(body: _message(false, message));
    }
  }
}
