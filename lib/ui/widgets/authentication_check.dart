import 'package:diagnostics/constants/preferences_constants.dart' as preferences_constants;
import 'package:diagnostics/routes/routes.dart' as routes;
import 'package:diagnostics/services/local_authentication_service.dart';
import 'package:diagnostics/data_sources/local/preferences_db_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationCheck extends StatefulWidget {
  const AuthenticationCheck({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AuthenticationCheck> createState() => _AuthenticationCheckState();
}

class _AuthenticationCheckState extends State<AuthenticationCheck> {
  final PreferencesDbClient preferencesService = Get.find();
  final ValueNotifier<bool> isLocalAuthFailed = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    checkLocalAuth();
  }

  checkLocalAuth() async {
    final LocalAuthenticationService authentication = Get.find();
    final isLocalAuthAvailable = await authentication.isBiometricAvailable();
    isLocalAuthFailed.value = false;

    if (!preferencesService.getBoolean(preferences_constants.keyEnableSecurity)) {
      Get.offNamed(routes.medicalExamListPage);
    } else {
      if (isLocalAuthAvailable) {
        final authenticated = await authentication.authenticate();

        if (!authenticated) {
          isLocalAuthFailed.value = true;
        } else {
          if (!mounted) return;
          Get.offNamed(routes.medicalExamListPage);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ValueListenableBuilder<bool>(
        valueListenable: isLocalAuthFailed,
        builder: (context, failed, _) {
          return Container();
        },
      ),
    );
  }
}
