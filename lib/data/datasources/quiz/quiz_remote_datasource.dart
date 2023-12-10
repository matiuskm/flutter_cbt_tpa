import 'package:cbt_tpa_app/core/constants/variables.dart';
import 'package:cbt_tpa_app/data/datasources/auth/auth_local_datasources.dart';
import 'package:cbt_tpa_app/data/models/responses/quiz/quiz_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class QuizRemoteDatasource {
  Future<Either<String, QuizResponseModel>> getQuizByCategory(
      String cat) async {
    final token = await AuthLocalDatasource().getToken();
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    final response = await http.get(
      Uri.parse('$baseUrl/get-questions?category=$cat'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(QuizResponseModel.fromJson(response.body));
    } else {
      return left('pengambilan data gagal / data tidak ditemukan');
    }
  }

  Future<Either<String, String>> createQuiz() async {
    final token = await AuthLocalDatasource().getToken();
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    final response = await http.post(
      Uri.parse('$baseUrl/create-test'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right('Quiz berhasil dibuat');
    } else {
      return left('Quiz gagal dibuat');
    }
  }
}
