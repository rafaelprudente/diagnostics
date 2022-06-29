import 'dart:io';

import 'package:diagnostics/constants/appearance_constants.dart' as appearance_constants;
import 'package:diagnostics/constants/label_constants.dart' as label_constants;
import 'package:diagnostics/constants/provider_constants.dart' as provider_constants;
import 'package:diagnostics/controllers/doctors_controller.dart';
import 'package:diagnostics/data_sources/remote/rest_client.dart';
import 'package:diagnostics/routes/routes.dart';
import 'package:diagnostics/routes/routes.dart' as routes;
import 'package:diagnostics/services/doctors_service.dart';
import 'package:diagnostics/services/local_authentication_service.dart';
import 'package:diagnostics/services/preferences_service.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  final dio = Dio();
  dio.options.headers[provider_constants.authorizationHeaderLabel] = provider_constants.authorizationHeaderValue;
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  };

  await Get.putAsync(() => LocalAuthenticationService(authentication: LocalAuthentication()).init());
  await Get.putAsync(() => PreferencesService().init());
  await Get.putAsync(() => DoctorsService().init());

  Get.lazyPut(() => DoctorsController());
  Get.lazyPut(() => DoctorsRestClient(dio));

  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  timeago.setLocaleMessages('pt_br', timeago.PtBrMessages());
  timeago.setDefaultLocale('pt_br');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: label_constants.applicationName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: appearance_constants.primarySwatch,
      ),
      routes: Routes.list,
      initialRoute: routes.authenticationCheck,
      navigatorKey: Routes.navigatorKey,
    );
  }
}
