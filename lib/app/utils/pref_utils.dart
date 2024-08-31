
import 'package:shared_preferences/shared_preferences.dart';


class PrefUtils {
  static String prefName = "com.familylocationapp.app";

  static String isLogin = 'login';
  static String isIntro = 'intro';
  static String userId = 'user_id';
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<SharedPreferences> get getPref async {
    return _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  static setIntro(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isIntro, value);
  }

  static Future<bool> getIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isIntro) ?? true;
  }

  static setLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, value);
  }

  static Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin) ?? true;
  }

  static getIsIntro() async {
    bool intValue = _sharedPreferences!.getBool(isIntro) ?? true;
    return intValue;
  }

  static getIsSignIn() async {
    return _sharedPreferences!.getBool(isLogin) ?? false;
  }

  // static setUserId(String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(isIntro, value);
  // }

  static Future<void> setUserId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userId, value);
  }

  static Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId) ?? '';
  }
}
