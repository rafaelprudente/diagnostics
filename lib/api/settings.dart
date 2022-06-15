import 'package:get_storage/get_storage.dart';

class Settings {
  final GetStorage preferences = GetStorage('preferences');

  int length() {
    return 0;
  }

  Set<String> keys() {
    Set<String> returnValue = {};
    return returnValue;
  }

  bool getBool(String key) {
    bool returnValue = false;
    return returnValue;
  }

  void setBool(String key, bool value) async {
  }
}
