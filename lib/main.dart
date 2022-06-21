import 'package:diagnostics/pages/authentication_page.dart';
import 'package:diagnostics/pages/diagnostics_add_page.dart';
import 'package:diagnostics/pages/diagnostics_list_page.dart';
import 'package:diagnostics/pages/settings_page.dart';
import 'package:diagnostics/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/general.dart' as constants;
import 'services/settings_service.dart';

Future<void> main() async {
  await GetStorage.init();
  await Get.putAsync(() => SettingsService().init());
  await Get.putAsync(() => ThemeService().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: constants.applicationName,
      routes: {
        '/settings': (context) => const SettingsPage(
              title: '${constants.applicationName} Settings',
            ),
        '/home': (context) => const DiagnosticsListPage(
              title: '${constants.applicationName} Home',
            ),
        '/diagnostics_add': (context) => const DiagnosticsAddPage(
              title: '${constants.applicationName} New',
            ),
      },
      theme: ThemeService().currentTheme,
      home: const AuthenticationPage(
          title: '${constants.applicationName} Authentication'),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/