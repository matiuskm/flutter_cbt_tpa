import 'package:cbt_tpa_app/core/constants/variables.dart';
import 'package:cbt_tpa_app/data/datasources/auth/auth_local_datasources.dart';
import 'package:cbt_tpa_app/data/models/models.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, LoginResponseModel>> login(
      LoginRequestModel data) async {
    final headers = {'Content-Type': 'application/json; charset=UTF-8'};
    final response = await http.post(Uri.parse('$baseUrl/login'),
        headers: headers, body: data.toJson());
    if (response.statusCode == 200) {
      return right(LoginResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel data) async {
    final headers = {'Content-Type': 'application/json; charset=UTF-8'};
    final response = await http.post(Uri.parse('$baseUrl/register'),
        headers: headers, body: data.toJson());

    if (response.statusCode == 201) {
      return right(RegisterResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, String>> logout() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    final response =
        await http.post(Uri.parse('$baseUrl/logout'), headers: headers);

    if (response.statusCode == 200) {
      return right(response.body);
    } else {
      return left(response.body);
    }
  }
}
