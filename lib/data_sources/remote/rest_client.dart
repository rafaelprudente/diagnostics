import 'package:diagnostics/constants/provider_constants.dart' as provider_constants;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://${kDebugMode ? provider_constants.devBaseUrl : provider_constants.prdBaseUrl}/')
abstract class DoctorsRestClient {
  factory DoctorsRestClient(Dio dio, {String baseUrl}) = _DoctorsRestClient;

  @GET('/doctors/name_suggestions')
  Future<List<String>> getNameSuggestions(
      @Query("partName") String partName, @Query("page") int page, @Query("pageSize") int pageSize);
}
