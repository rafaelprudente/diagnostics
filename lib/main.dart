import 'dart:io';

import 'package:diagnostics/constants/application_constants.dart' as application_constants;
import 'package:diagnostics/constants/provider_constants.dart' as provider_constants;
import 'package:diagnostics/controllers/doctors_rest_controller.dart';
import 'package:diagnostics/data_sources/local/doctors_db_client.dart';
import 'package:diagnostics/data_sources/local/preferences_db_client.dart';
import 'package:diagnostics/data_sources/remote/doctors_rest_client.dart';
import 'package:diagnostics/routes/routes.dart';
import 'package:diagnostics/routes/routes.dart' as routes;
import 'package:diagnostics/services/local_authentication_service.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:local_auth/local_auth.dart';

void main() async {
  final dio = Dio();
  dio.options.headers[provider_constants.authorizationHeaderLabel] = provider_constants.authorizationHeaderValue;
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  };

  Get.lazyPut(() => PreferencesDbClient());
  Get.lazyPut(() => DoctorsRestClient(dio));
  Get.lazyPut(() => DoctorsDbClient());
  Get.lazyPut(() => DoctorsRestController());

  await Get.putAsync(() => LocalAuthenticationService(authentication: LocalAuthentication()).init());
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: application_constants.applicationName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: application_constants.primaryColor,
      ),
      routes: Routes.list,
      initialRoute: routes.authenticationCheck,
      navigatorKey: Routes.navigatorKey,
    );
  }
}
