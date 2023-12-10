import 'package:cbt_tpa_app/core/constants/variables.dart';
import 'package:cbt_tpa_app/data/datasources/auth/auth_local_datasources.dart';
import 'package:cbt_tpa_app/data/models/responses/material/materi_response_modal.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class MateriRemoteDatasource {
  Future<Either<String, MateriResponseModel>> getAllMaterials() async {
    final token = await AuthLocalDatasource().getToken();
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(Uri.parse('$baseUrl/get-all-materials'),
        headers: headers);

    if (response.statusCode == 200) {
      return right(MateriResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, MateriResponseModel>> getMaterialById(int id) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http
        .get(Uri.parse('$baseUrl/api/get-material?id=$id'), headers: headers);

    if (response.statusCode == 200) {
      return right(MateriResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}
