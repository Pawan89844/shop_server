import 'package:shelf/shelf.dart';
import 'package:shop_server/handler/products/add_product.dart';
import 'package:shop_server/handler/products/product.dart';

class AppAPI {
  Response rootHandler(Request req) {
    return Response.ok('Hello, World!\n');
  }

  Response getProducts(Request req) {
    return Response.ok('');
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
}
