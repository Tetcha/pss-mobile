import 'package:get/get.dart';
import 'package:pss_mobile/core/constants/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider extends GetxController {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceProvider(this._sharedPreference);

  SharedPreferences get instance => _sharedPreference;

  // General Methods: ----------------------------------------------------------
  String? get authToken {
    return _sharedPreference.getString(StoreKey.authToken);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return await _sharedPreference.setString(StoreKey.authToken, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(StoreKey.authToken);
  }

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference.getBool(StoreKey.isDarkMode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.setBool(StoreKey.isDarkMode, value);
  }
}
