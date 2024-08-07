import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shop_server/handler/cart/add_cart.dart';
import 'package:shop_server/handler/products/add_product.dart';
import 'package:shop_server/handler/products/get_products.dart';
import 'package:shop_server/handler/products/product.dart';

class AppAPI {
  Response rootHandler(Request req) {
    return Response.ok('Hello, World!\n');
  }

  Future<Response> getProducts(Request req) async {
    return await Product().getProducts(req);
  }

  Future<Response> addProduct(Request req) async {
    return await Product().addProduct(req);
  }

  Response removeProduct(Request req) {
    return Response.ok('Remove');
  }

  Response updateProduct(Request req) {
    return Response.ok('Update');
  }

  Response addToCart(Request req) {
    AddCart(req).addProduct();
    return Response.ok('Update');
  }
}
