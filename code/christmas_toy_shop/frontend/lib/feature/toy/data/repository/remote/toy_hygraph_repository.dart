import 'package:frontend/feature/toy/data/repository/toy_repository.dart';
import 'package:shared/shared.dart';

class ToyHygraphRepository extends ToyRepository {
  ToyHygraphRepository({required super.toyService});

  @override
  Future<List<Toy>> getToys() async {
    final Map<String, dynamic>? result = await toyService.getToysRaw();
    if (result == null || result["toys"] == null) {
      return [];
    }
    return (result["toys"] as List).map((e) => Toy.fromJson(e)).toList();
  }

  @override
  Future<Toy> getToyDetail(String toyId) async {
    final Map<String, dynamic>? result = await toyService.getToyDetailRaw(
      toyId,
    );
    return Toy.fromJson(result?["toy"]);
  }
}
