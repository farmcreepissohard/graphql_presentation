import 'package:frontend/feature/toy/data/service/toy_service.dart';
import 'package:shared/shared.dart';

class ToyRepository {
  final ToyService toyService;

  ToyRepository({required this.toyService});

  Future<List<Toy>> getToys() async {
    final Map<String, dynamic>? result = await toyService.getToysRaw();
    if (result == null || result["toys"] == null) {
      return [];
    }
    return (result["toys"] as List).map((e) => Toy.fromJson(e)).toList();
  }

  Future<Toy> getToyDetail(String toyId) async {
    final Map<String, dynamic>? result = await toyService.getToyDetailRaw(
      toyId,
    );
    return Toy.fromJson(result?["toy"]);
  }
}
