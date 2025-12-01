import 'package:frontend/feature/toy/data/repository/toy_repository.dart';
import 'package:shared/shared.dart';

class ToyLocalRepository extends ToyRepository {
  ToyLocalRepository({required super.toyService});

  @override
  Future<List<Toy>> getToys() async {
    final Map<String, dynamic>? result = await toyService.getToysRaw();
    if (result == null || result["getToys"] == null) {
      return [];
    }
    return (result["getToys"] as List).map((e) => Toy.fromJson(e)).toList();
  }

  @override
  Future<Toy> getToyDetail(String toyId) async {
    final Map<String, dynamic>? result = await toyService.getToyDetailRaw(
      toyId,
    );
    return Toy.fromJson(result?["getToyDetail"]);
  }
}
