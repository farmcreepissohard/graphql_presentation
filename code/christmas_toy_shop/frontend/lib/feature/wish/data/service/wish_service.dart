import 'package:graphql_flutter/graphql_flutter.dart';

abstract class WishService {
  final GraphQLClient client;
  WishService({required this.client});

  Future<Map<String, dynamic>?> getWishesRaw();
  Future<Map<String, dynamic>?> sendWishRaw({
    required String writer,
    required String content,
    String? dear,
  });
  Future<Map<String, dynamic>?> getCountWishesRaw();
}
