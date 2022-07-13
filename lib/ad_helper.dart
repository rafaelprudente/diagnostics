import 'dart:io';

import 'package:diagnostics/constants/application_constants.dart' as application_constants;

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return application_constants.bannerUnitId;
    } else if (Platform.isIOS) {
      return application_constants.appleApplicationId;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
