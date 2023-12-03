import 'package:cbt_tpa_app/data/models/responses/auth/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  Future<void> saveAuthData(LoginResponseModel data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth', data.toJson());
  }

  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth');
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = LoginResponseModel.fromJson(authJson);
    return authData.accessToken;
  }

  Future<LoginUser> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = LoginResponseModel.fromJson(authJson);
    return authData.user;
  }

  Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }
}
