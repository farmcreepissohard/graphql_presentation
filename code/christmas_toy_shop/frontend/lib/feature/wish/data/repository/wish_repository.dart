import 'package:frontend/feature/wish/data/service/wish_service.dart';
import 'package:shared/shared.dart';

class WishRepository {
  final WishService wishApi;

  WishRepository({required this.wishApi});

  Future<List<Wish>> getWishes() async {
    final result = await wishApi.getWishesRaw();
    return ((result?["wishes"] ?? []) as List)
        .map((e) => Wish.fromJson(e))
        .toList();
  }

  Future<Wish> sendWish({
    required String writer,
    required String content,
    String? dear,
  }) async {
    final result = await wishApi.sendWishRaw(
      writer: writer,
      content: content,
      dear: dear,
    );
    return Wish.fromJson(result?["publishWish"]);
  }

  Future<int> getCountWishes() async {
    final result = await wishApi.getCountWishesRaw();
    return result?["wishesConnection"]?["aggregate"]?["count"] ?? 0;
  }
}
