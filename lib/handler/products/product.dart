import 'package:shelf/shelf.dart';
import 'package:shop_server/handler/products/add_product.dart';
import 'package:shop_server/handler/products/get_products.dart';

class Product {
  Future<Response> addProduct(Request request) async {
    return await AddProduct(request).addProduct();
  }

  Future<Response> getProducts(Request request) async {
    return GetProducts(request).getProducts();
  }
}
