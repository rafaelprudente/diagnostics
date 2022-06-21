import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/storage.dart' as storage_constants;
import '../constants/settings_keys.dart' as settings_keys_constants;

class SettingsService extends GetxService {
  final GetStorage settings = GetStorage(storage_constants.settingsStorageName);
  final List<String> listSettings = [
    settings_keys_constants.enableSecurityLabel,
    settings_keys_constants.themeLabel
  ];

  Future<SettingsService> init() async {
    return this;
  }

  int length() {
    return listSettings.length;
  }

  List<String> keys() {
    return listSettings;
  }

  bool getBoolean(String key) {
    return settings.read(key) ?? false;
  }

  putBoolean(String key, bool value) {
    settings.write(key, value);
  }

  String getString(String key) {
    return settings.read(key) ?? '';
  }

  putString(String key, String value) {
    settings.write(key, value);
  }
}
