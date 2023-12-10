import 'dart:convert';

class MateriResponseModel {
  final String status;
  final List<Materi> data;

  MateriResponseModel({
    required this.status,
    required this.data,
  });

  factory MateriResponseModel.fromJson(String str) =>
      MateriResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MateriResponseModel.fromMap(Map<String, dynamic> json) =>
      MateriResponseModel(
        status: json["status"],
        data: List<Materi>.from(json["data"].map((x) => Materi.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Materi {
  final int id;
  final String title;
  final String imageUrl;
  final String content;
  final dynamic createdAt;
  final dynamic updatedAt;

  Materi({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Materi.fromJson(String str) => Materi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Materi.fromMap(Map<String, dynamic> json) => Materi(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"] ?? '',
        content: json["content"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "content": content,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
