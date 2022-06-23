import 'package:diagnostics/pages/my_home_page.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_check.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list = <String, WidgetBuilder>{
    '/pages/my-home-page': (_) => const MyHomePage(title: 'Diagnostics'),
    '/widgets/auth-check': (_) => const AuthCheck(title: 'Diagnostics'),
  };

  static String initial = '/pages/my-home-page';
  static String authCheck = '/widgets/auth-check';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState to = Routes.navigatorKey!.currentState!;
}