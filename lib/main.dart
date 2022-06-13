import 'package:diagnostics/pages/authentication_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'general/constants.dart' as constants;
import 'pages/diagnostics_list_page.dart';
import 'api/settings.dart';

void main() async {
  await GetStorage.init(constants.settingsStorageName);
  runApp(const DiagnosticsApp());
}

var theme = darkTheme;

var darkTheme = ThemeData(
  primaryColor: Colors.red,
  brightness: Brightness.dark,
);

var lightTheme = ThemeData(
  primaryColor: Colors.red,
  brightness: Brightness.light,
);

class DiagnosticsApp extends StatefulWidget {
  const DiagnosticsApp({Key? key}) : super(key: key);

  @override
  State<DiagnosticsApp> createState() => _DiagnosticsAppState();
}

class _DiagnosticsAppState extends State<DiagnosticsApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    changeTheme();
  }

  @override
  void didChangePlatformBrightness() {
    changeTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void changeTheme() {
    var brightness = WidgetsBinding.instance.window.platformBrightness;
    brightness == Brightness.dark ? theme = darkTheme : theme = lightTheme;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: constants.applicationName,
      theme: theme,
      home: firstPage(),
    );
  }
}

Widget firstPage() {
  Settings settings = Settings();

  if (settings.getBool(constants.requireAuthenticationKey)) {
    return const AuthenticationPage(title: 'Diagnostics');
  } else {
    return const DiagnosticsListPage(title: 'Diagnostics');
  }
}
