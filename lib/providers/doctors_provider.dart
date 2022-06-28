import 'dart:async';

import 'package:diagnostics/constants/provider_constants.dart' as provider_constants;
import 'package:diagnostics/model/doctor.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DoctorsProvider extends GetConnect {
  Future<List<Doctor>> getDoctors(String query) async {
    final headers = {provider_constants.authorizationHeaderLabel: provider_constants.authorizationHeaderValue};
    String url = '';
    if (kDebugMode) {
      url = 'https://${provider_constants.devBaseUrl}/doctors/name_suggestions?partName=$query&page=1&pageSize=1000';
    } else {
      url = 'https://${provider_constants.prdBaseUrl}/doctors/name_suggestions?partName=$query&page=1&pageSize=1000';
    }

    FutureOr<List<Doctor>> futureOr = List<Doctor>.empty();

    final response = await get(url, headers: headers);

    if (response.status.hasError) {
      return futureOr;
    } else {
      return response.body;
    }
  }
}
