import 'package:diagnostics/constants/label_constants.dart' as label_constants;
import 'package:diagnostics/pages/my_home_page.dart';
import 'package:diagnostics/widgets/authentication_check.dart';
import 'package:flutter/material.dart';

import '../pages/my_preferences_page.dart';

const String initial = '/pages/my-home-page';
const String preferences = '/pages/my-preferences-page';
const String authenticationCheck = '/widgets/auth-check';

class Routes {
  static Map<String, Widget Function(BuildContext)> list = <String, WidgetBuilder>{
    authenticationCheck: (_) => const AuthenticationCheck(title: label_constants.applicationName),
    initial: (_) => const MyHomePage(title: label_constants.applicationName),
    preferences: (_) => const MyPreferencesPage(title: label_constants.applicationName),
  };

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState to = Routes.navigatorKey!.currentState!;
}
