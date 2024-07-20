import 'package:ingo/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class OnBoardDatasource {
  bool isLoggedIn();
  Future<bool> logIn();
  Future<bool> saveLanguage(String locale);
  String getLanguage();
}

class OnBoardDatadourceImpl extends OnBoardDatasource {
  final SharedPreferences sharedPreferences;
  OnBoardDatadourceImpl({required this.sharedPreferences});

  @override
  bool isLoggedIn() {
    try {
      var value = sharedPreferences.getBool('isLoggedIn');
      return value ?? false;
    } catch (e) {
      throw SharedPreferencesException(e.toString());
    }
  }

  @override
  Future<bool> logIn() async {
    try {
      var value = await sharedPreferences.setBool('ísLoggedIn', true);
      return value;
    } catch (e) {
      throw SharedPreferencesException(e.toString());
    }
  }

  @override
  Future<bool> saveLanguage(String locale) async {
    try {
      var value = await sharedPreferences.setString('language', locale);
      return value;
    } catch (e) {
      throw SharedPreferencesException(e.toString());
    }
  }

  @override
  String getLanguage() {
    try {
      var value = sharedPreferences.getString('language');
      return value ?? '';
    } catch (e) {
      throw SharedPreferencesException(e.toString());
    }
  }
}
