class Wish {
  final String writer;
  final String? dear;
  final String content;
  final DateTime createdDate;

  Wish({
    required this.writer,
    required this.content,
    this.dear,
    required this.createdDate,
  });

  factory Wish.fromJson(Map<String, dynamic> json) {
    return Wish(
      writer: json["writer"],
      content: json["content"],
      dear: json["dear"],
      createdDate: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "writer": writer,
      "dear": dear ?? "",
      "content": content,
      "createdAt": createdDate,
    };
  }
}
