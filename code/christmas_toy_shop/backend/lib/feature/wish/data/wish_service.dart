import 'package:mongo_dart/mongo_dart.dart';

class WishService {
  final DbCollection _dbCollection;

  WishService({required DbCollection dbCollection})
      : _dbCollection = dbCollection;

  Future<List<Map<String, dynamic>>?> getWishesRaw() async {
    return _dbCollection.find().toList();
  }

  Future<Map<String, dynamic>?> sendWishRaw({
    required String writer,
    required String content,
    String? dear,
  }) async {
    final newWish = <String, dynamic>{
      'writer': writer,
      'content': content,
      'dear': dear,
      'createdAt':
          DateTime.now().toUtc().toIso8601String().replaceAll('Z', '+00:00'),
    };

    final result = await _dbCollection.insertOne(newWish);

    if (!result.isSuccess) {
      throw Exception('Can not insert wish');
    }

    return result.document!;
  }

  Future<int?> getCountWishesRaw() async {
    return _dbCollection.count();
  }
}
