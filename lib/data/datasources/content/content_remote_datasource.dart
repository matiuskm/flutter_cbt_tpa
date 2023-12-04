import 'dart:developer';

import 'package:cbt_tpa_app/core/constants/variables.dart';
import 'package:cbt_tpa_app/data/datasources/auth/auth_local_datasources.dart';
import 'package:cbt_tpa_app/data/models/responses/content/content_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ContentRemoteDatasource {
  Future<Either<String, ContentResponseModel>> loadAboutUs() async {
    final token = await AuthLocalDatasource().getToken();

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
        Uri.parse('$baseUrl/get-content?section=aboutus'),
        headers: headers);
    if (response.statusCode == 200) {
      return Right(ContentResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, ContentResponseModel>> loadTips() async {
    final token = await AuthLocalDatasource().getToken();

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http
        .get(Uri.parse('$baseUrl/get-content?section=tips'), headers: headers);
    if (response.statusCode == 200) {
      return Right(ContentResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }
}
