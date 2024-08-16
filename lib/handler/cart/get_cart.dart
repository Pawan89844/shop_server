import 'package:shelf/shelf.dart';

import '../../model/cart/cart_model.dart';
import '../../service/db_service.dart';

class GetCartProduct {
  final DBService _service = DBService();
  final Request request;

  GetCartProduct(this.request);

  List<CartModel> _cart = [];

  void getProduct() async {}
}
