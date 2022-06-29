import 'dart:async';
import 'package:diagnostics/constants/provider_constants.dart' as provider_constants;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DoctorsProvider extends GetConnect {
  DoctorsProvider() {
    allowAutoSignedCert = true;
  }

/*
  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
    //httpClient.defaultDecoder = CityModel.listFromJson;
    httpClient.addRequestModifier((request) {
      request.headers[provider_constants.authorizationHeaderLabel] = provider_constants.authorizationHeaderValue;
      return request;
    });
  }
*/

  Future<Response<List<String>>> getNameSuggestions(String query) => get<List<String>>(
      'https://${kDebugMode ? provider_constants.devBaseUrl : provider_constants.prdBaseUrl}/doctors/name_suggestions?partName=$query&page=1&pageSize=1000');
/*
  Future<List<String>> getDoctors(String query) async {
    final headers = {provider_constants.authorizationHeaderLabel: provider_constants.authorizationHeaderValue};
    String url = '';
    if (kDebugMode) {
      url = 'https://${provider_constants.devBaseUrl}/doctors/name_suggestions?partName=$query&page=1&pageSize=1000';
    } else {
      url = 'https://${provider_constants.prdBaseUrl}/doctors/name_suggestions?partName=$query&page=1&pageSize=1000';
    }

    FutureOr<List<String>> futureOr = List<String>.empty();

    final response = await get<List<String>>(url, headers: headers);

    if (response.status.hasError) {
      return futureOr;
    } else {
      return response.body;
    }
  }
  */
}
