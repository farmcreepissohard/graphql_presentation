import 'package:backend/core/database/mongo_client.dart';
import 'package:backend/feature/toy/data/toy_service.dart';
import 'package:backend/feature/wish/data/wish_service.dart';

class Container {
  static ToyService? _toyService;
  static WishService? _wishService;

  static Future<ToyService> get toyService async {
    if (_toyService == null) {
      await _initToyService();
    }
    return _toyService!;
  }

  static Future<WishService> get wishService async {
    if (_wishService == null) {
      await _initWishService();
    }
    return _wishService!;
  }

  static Future<void> _initToyService() async {
    final collection = await MongoClient.toysCollection;
    _toyService = ToyService(dbCollection: collection);
  }

  static Future<void> _initWishService() async {
    final collection = await MongoClient.wishesCollection;
    _wishService = WishService(dbCollection: collection);
  }
}
