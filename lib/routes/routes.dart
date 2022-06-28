import 'package:diagnostics/constants/label_constants.dart' as label_constants;
import 'package:diagnostics/pages/medical_exam_add_page.dart';
import 'package:diagnostics/pages/medical_exam_list_page.dart';
import 'package:diagnostics/widgets/authentication_check.dart';
import 'package:flutter/material.dart';

import '../pages/preferences_list_page.dart';

const String authenticationCheck = '/widgets/authentication-check';

const String medicalExamListPage = '/pages/medical-exam-list-page';
const String medicalExamAddPage = '/pages/medical-exam-add-page';
const String preferencesListPage = '/pages/preferences-list-page';

class Routes {
  static Map<String, Widget Function(BuildContext)> list = <String, WidgetBuilder>{
    authenticationCheck: (_) => const AuthenticationCheck(title: label_constants.applicationName),
    medicalExamListPage: (_) => const MedicalExamListPage(title: label_constants.applicationName),
    medicalExamAddPage: (_) => const MedicalExamAddPage(title: label_constants.applicationName),
    preferencesListPage: (_) => const PreferencesListPage(title: label_constants.applicationName),
  };

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState to = Routes.navigatorKey!.currentState!;
}
