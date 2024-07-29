import 'package:shelf_router/shelf_router.dart';
import 'package:shop_server/api/app_api.dart';
import 'package:shop_server/router/app_routes.dart';

class AppRouter {
  final Router _router = Router();
  final AppAPI _appAPI = AppAPI();

  Router get router => _hostedAPI();

  Router _hostedAPI() => _router
    ..get(AppRoutes.home, _appAPI.rootHandler)
    ..post(AppRoutes.addProduct, _appAPI.addProduct);
}
