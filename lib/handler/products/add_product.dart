import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shop_server/constants/app_constants.dart';
import 'package:shop_server/model/product/product_model.dart';
import 'package:shop_server/service/db_service.dart';

class AddProduct {
  final DBService _dbService = DBService();
  final Request request;

  AddProduct(this.request);

  Future<Map<String, dynamic>> _insertToDB(String req) async {
    final userInputJson = jsonDecode(req);
    final userInput = ProductModel.fromUser(userInputJson);
    final model = ProductModel(
        prodImage: userInput.prodImage,
        prodName: userInput.prodName,
        prodDetails: userInput.prodDetails);
    final document = model.toJson();
    final collection = _dbService.db.collection(AppString.PRODUCT);
    final res = await collection.insert(document);
    return res;
  }

  Future<Map<String, dynamic>?> _openDB() async {
    final req = await request.readAsString();
    await _dbService.initialize();
    if (_dbService.db.isConnected) {
      Map<String, dynamic> resDB = await _insertToDB(req);
      return resDB;
    }
    return null;
  }

  String _message(bool isSuccess, dynamic message) {
    return JsonEncoder.withIndent('  ')
        .convert({'status': isSuccess, 'message': message});
  }

  Response _isSuccess(Map<String, dynamic>? isSuccess) {
    if (isSuccess != null) {
      return Response.ok(_message(true, AppString.productAdded),
          headers: AppString.defaultHeader);
    } else {
      return Response.ok(_message(true, AppString.productFailed),
          headers: AppString.defaultHeader);
    }
  }

  Future<Response> addProduct() async {
    if (request.method == AppString.POST) {
      final isSuccess = await _openDB();
      return _isSuccess(isSuccess);
    }
    final message = AppString.badRequest(AppString.POST);
    return Response.badRequest(body: _message(false, message));
  }
}
