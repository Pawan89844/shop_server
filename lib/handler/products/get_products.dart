// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'dart:developer';

import 'package:shelf/shelf.dart';
import 'package:shop_server/constants/app_constants.dart';
import 'package:shop_server/model/product/product_model.dart';

import '../../service/db_service.dart';

class GetProducts {
  final DBService _dbService = DBService();
  final Request request;
  GetProducts(this.request);

  List<ProductModel> _products = [];

  String _message(bool isSuccess, dynamic message) {
    return JsonEncoder.withIndent('  ')
        .convert({'status': isSuccess, 'message': message});
  }

  Future<List<ProductModel>> _getProductsDB() async {
    final collection = _dbService.db.collection(AppString.PRODUCT);
    List<ProductModel> prod = [];
    for (final products in await collection.find().toList()) {
      final data = ProductModel.fromDB(products);
      prod.add(data);
    }
    return prod;
  }

  Future<List<ProductModel>> _openDB() async {
    await _dbService.initialize();
    if (_dbService.db.isConnected) {
      return await _getProductsDB();
    }
    return _products;
  }

  Response _isSuccess(List<ProductModel> isSuccess) {
    if (isSuccess.isNotEmpty) {
      return Response.ok(_message(true, isSuccess),
          headers: AppString.defaultHeader);
    } else {
      return Response.ok(_message(true, isSuccess),
          headers: AppString.defaultHeader);
    }
  }

  Future<Response> getProducts() async {
    if (request.method == AppString.GET) {
      final products = await _openDB();
      return _isSuccess(products);
    }
    final message = AppString.badRequest(AppString.GET);
    return Response.badRequest(body: _message(false, message));
  }
}
