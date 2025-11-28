abstract class WishService {
  Future<Map<String, dynamic>?> getWishesRaw();
  Future<Map<String, dynamic>?> sendWishRaw({
    required String writer,
    required String content,
    String? dear,
  });
  Future<Map<String, dynamic>?> getCountWishesRaw();
}
