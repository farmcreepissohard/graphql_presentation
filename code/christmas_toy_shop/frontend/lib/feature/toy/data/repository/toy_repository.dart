import 'package:frontend/feature/toy/data/service/toy_service.dart';
import 'package:shared/shared.dart';

abstract class ToyRepository {
  final ToyService toyService;
  ToyRepository({required this.toyService});

  Future<List<Toy>> getToys();
  Future<Toy> getToyDetail(String toyId);
}
