import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  int length() {
    int returnValue = 0;
    preferences.then((sharedPreferences) =>
        returnValue = sharedPreferences.getKeys().length);
    return returnValue;
  }

  Set<String> keys() {
    Set<String> returnValue = {};
    preferences
        .then((sharedPreferences) => returnValue = sharedPreferences.getKeys());
    return returnValue;
  }

  bool getBool(String key) {
    bool returnValue = false;
    preferences.then((sharedPreferences) {
      if (sharedPreferences.containsKey(key)) {
        returnValue = sharedPreferences.getBool(key)!;
      }
    });
    return returnValue;
  }

  void setBool(String key, bool value) async {
    preferences
        .then((sharedPreferences) => sharedPreferences.setBool(key, value));
  }
}
