import 'package:shelf/shelf.dart';
import 'package:shop_server/handler/products/add_product.dart';

class Product {
  Future<Response> addProduct(Request request) async {
    return await AddProduct(request).addProduct();
  }
}
