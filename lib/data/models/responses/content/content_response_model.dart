import 'dart:convert';

class ContentResponseModel {
  final String status;
  final Data data;

  ContentResponseModel({
    required this.status,
    required this.data,
  });

  factory ContentResponseModel.fromJson(String str) =>
      ContentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentResponseModel.fromMap(Map<String, dynamic> json) =>
      ContentResponseModel(
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}

class Data {
  final int id;
  final String title;
  final String section;
  final dynamic imageUrl;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.title,
    required this.section,
    required this.imageUrl,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        section: json["section"],
        imageUrl: json["image_url"] ?? '',
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "section": section,
        "image_url": imageUrl,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
