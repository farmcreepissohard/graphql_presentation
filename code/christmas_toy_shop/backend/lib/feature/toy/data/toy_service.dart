import 'package:mongo_dart/mongo_dart.dart';

class ToyService {
  final DbCollection _dbCollection;

  ToyService({required DbCollection dbCollection})
      : _dbCollection = dbCollection;

  Future<List<Map<String, dynamic>>?> getToysRaw() async {
    return _dbCollection.find().toList();
  }

  Future<Map<String, dynamic>?> getToyDetailRaw(String id) async {
    try {
      return _dbCollection.findOne(where.eq('toyId', id));
    } catch (e) {
      return null;
    }
  }
}
