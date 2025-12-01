import 'package:frontend/feature/wish/data/service/wish_service.dart';
import 'package:shared/shared.dart';

abstract class WishRepository {
  final WishService wishService;
  WishRepository({required this.wishService});

  Future<List<Wish>> getWishes();
  Future<Wish> sendWish({
    required String writer,
    required String content,
    String? dear,
  });
  Future<int> getCountWishes();
}
