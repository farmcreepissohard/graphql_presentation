import 'package:backend/container.dart';
import 'package:leto_schema/leto_schema.dart';

part 'toy_schema.g.dart';

@GraphQLObject()
class ToyImageSchema {
  final String url;
  ToyImageSchema({required this.url});
}

@GraphQLObject()
class ToyDescriptionSchema {
  final String text;
  ToyDescriptionSchema({required this.text});
}

@GraphQLObject()
class ToySchema {
  final String toyId;
  final String name;
  final double price;
  final ToyDescriptionSchema description;
  final ToyImageSchema image;
  final int quantity;

  ToySchema({
    required this.toyId,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.quantity,
  });

  factory ToySchema.fromMongo(Map<String, dynamic> doc) {
    return ToySchema(
      toyId: doc['toyId'] as String,
      name: doc['name'] as String,
      price: (doc['price'] as num?)?.toDouble() ?? 0.0,
      description: ToyDescriptionSchema(
        text: doc['description']?['text']?.toString() ?? '',
      ),
      image: ToyImageSchema(
        url: doc['image']?['url']?.toString() ?? '',
      ),
      quantity: (doc['quantity'] ?? 0) as int,
    );
  }
}

@Query()
Future<List<ToySchema>?> getToys() async {
  final service = await Container.toyService;
  final rawData = await service.getToysRaw();
  return rawData!
      .map(
        (e) => ToySchema.fromMongo(e),
      )
      .toList();
}

@Query()
Future<ToySchema?> getToyDetail(String toyId) async {
  final service = await Container.toyService;
  final rawData = await service.getToyDetailRaw(toyId);
  return ToySchema.fromMongo(rawData!);
}
