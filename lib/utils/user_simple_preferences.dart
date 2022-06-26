import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences = null!;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setSalaoId(int salaoId) {
    _preferences.setInt('salaoId', salaoId);
  }

  static setToken(String token) {
    _preferences.setString('token', token);
  }

  static setRazaoSocial(String razaoSocial) {
    _preferences.setString('razaoSocial', razaoSocial);
  }

  static String getRazaoSocial() {
    return _preferences.getString('razaoSocial')!;
  }
}
