import 'package:shared_preferences/shared_preferences.dart';

class OnboardingLocalDatasource {
  Future<bool> getAlreadyPassed() async {
    final prefs = await SharedPreferences.getInstance();
    final flag = prefs.getBool('is_first_time');
    return flag!;
  }

  Future<void> setAlreadyPassed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_time)', true);
  }
}
