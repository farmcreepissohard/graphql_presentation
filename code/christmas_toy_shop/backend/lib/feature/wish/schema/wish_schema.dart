import 'package:backend/container.dart';
import 'package:leto_schema/leto_schema.dart';

part 'wish_schema.g.dart';

@GraphQLObject()
class WishSchema {
  final String writer;
  final String? dear;
  final String content;
  final String createdAt;

  WishSchema({
    required this.writer,
    required this.content,
    required this.createdAt,
    this.dear,
  });

  factory WishSchema.fromMongo(Map<String, dynamic> doc) {
    return WishSchema(
      writer: doc['writer'] as String,
      dear: doc['dear'] as String?,
      content: doc['content'] as String,
      createdAt: doc['createdAt'] as String,
    );
  }
}

@Query()
Future<List<WishSchema>?> getWishes() async {
  final service = await Container.wishService;
  final rawData = await service.getWishesRaw();
  if (rawData == null) {
    return null;
  }
  return rawData
      .map(
        (e) => WishSchema.fromMongo(e),
      )
      .toList();
}

@Query()
Future<int?> getCountWishes() async {
  final service = await Container.wishService;
  final rawData = await service.getCountWishesRaw();
  return rawData;
}

@Mutation()
Future<WishSchema?> sendWish(
    {required String writer, required String content, String? dear}) async {
  final service = await Container.wishService;
  final rawData =
      await service.sendWishRaw(writer: writer, content: content, dear: dear);

  if (rawData == null) {
    return null;
  }
  return WishSchema.fromMongo(rawData);
}
