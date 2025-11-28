class Toy {
  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final int quantity;

  Toy({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.quantity,
  });

  factory Toy.fromJson(Map<String, dynamic> json) {
    return Toy(
      id: json["toyId"],
      name: json["name"],
      price: json["price"],
      description: json["description"]?["text"] ?? "",
      imageUrl: json["image"]?["url"] ?? "",
      quantity: json["quantity"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "toy_id": id,
      "name": name,
      "price": price,
      "description": {"text": description},
      "image": {"url": imageUrl},
      "quantity": quantity,
    };
  }
}
