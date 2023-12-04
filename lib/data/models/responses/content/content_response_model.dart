import 'dart:convert';

class ContentResponseModel {
  final String status;
  final String data;

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
        data: json["data"].replaceAll("\\n", "\n"),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data,
      };
}
