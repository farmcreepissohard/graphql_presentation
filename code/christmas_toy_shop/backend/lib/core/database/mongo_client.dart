import 'package:dotenv/dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoClient {
  static Db? _mongodb;

  static final String _connectionString = _load();

  static String _load() {
    final env = DotEnv(includePlatformEnvironment: true)..load();
    final uri = env['MONGODB_URI'];

    if (uri == null || uri.isEmpty) {
      throw Exception('can not find MONGODB_URI');
    }
    return uri;
  }

  static Future<Db> get connection async {
    if (_mongodb == null || !_mongodb!.isConnected) {
      _mongodb = await Db.create(_connectionString);
      await _mongodb!.open();
    }
    return _mongodb!;
  }

  static Future<DbCollection> get toysCollection async =>
      (await connection).collection('toy');

  static Future<DbCollection> get wishesCollection async =>
      (await connection).collection('wish');
}
