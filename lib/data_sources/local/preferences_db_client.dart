import 'package:get_storage/get_storage.dart';

class PreferencesDbClient {
  GetStorage preferencesBox = GetStorage('PreferencesBox');

  bool getBoolean(String key) {
    return preferencesBox.hasData(key) ? preferencesBox.read(key) : false;
  }

  putBoolean(String key, bool value) {
    preferencesBox.write(key, value);
  }
}
