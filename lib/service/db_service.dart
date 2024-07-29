import 'package:mongo_dart/mongo_dart.dart';
import 'package:shop_server/constants/app_constants.dart';

class DBService {
  static final DBService _instance = DBService._internal();

  DBService._internal();

  factory DBService() => _instance;

  late Db db;

  Future<dynamic> initialize() async {
    db = await Db.create(AppString.dbUrl);
    return await db.open();
  }
}
