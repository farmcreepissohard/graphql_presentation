import 'package:frontend/feature/wish/data/repository/wish_repository.dart';
import 'package:shared/shared.dart';

class WishHygraphRepository extends WishRepository {
  WishHygraphRepository({required super.wishService});

  @override
  Future<List<Wish>> getWishes() async {
    final result = await wishService.getWishesRaw();
    return ((result?["wishes"] ?? []) as List)
        .map((e) => Wish.fromJson(e))
        .toList();
  }

  @override
  Future<Wish> sendWish({
    required String writer,
    required String content,
    String? dear,
  }) async {
    final result = await wishService.sendWishRaw(
      writer: writer,
      content: content,
      dear: dear,
    );
    return Wish.fromJson(result?["publishWish"]);
  }

  @override
  Future<int> getCountWishes() async {
    final result = await wishService.getCountWishesRaw();
    return result?["wishesConnection"]?["aggregate"]?["count"] ?? 0;
  }
}
