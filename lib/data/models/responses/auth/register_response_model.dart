import 'dart:convert';

class RegisterResponseModel {
  final String accessToken;
  final RegisterUser user;

  RegisterResponseModel({
    required this.accessToken,
    required this.user,
  });

  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        accessToken: json["access_token"],
        user: RegisterUser.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "user": user.toMap(),
      };
}

class RegisterUser {
  final String name;
  final String email;
  final String roles;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  RegisterUser({
    required this.name,
    required this.email,
    required this.roles,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory RegisterUser.fromJson(String str) =>
      RegisterUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterUser.fromMap(Map<String, dynamic> json) => RegisterUser(
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "roles": roles,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
