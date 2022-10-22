import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static late SharedPreferences _sharedPreferences;

  static _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// get data by dynamic key
  static getData({required dynamic key}) async {
    await _init();
    return _sharedPreferences.get(key);
  }

  static Future<bool> setData({
    required key,
    required value,
  }) async {
    await _init();
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);

    return await _sharedPreferences.setString(key, value);
  }
}
