import 'package:diagnostics/constants/preferences_constants.dart' as preferences_constants;
import 'package:diagnostics/services/preferences_service.dart';
import 'package:diagnostics/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPreferencesPage extends StatefulWidget {
  const MyPreferencesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPreferencesPage> createState() => _MyPreferencesPageState();
}

class _MyPreferencesPageState extends State<MyPreferencesPage> {
  final PreferencesService preferencesService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(title: Text(widget.title)),
        body: ListView(
          children: <Widget>[
            SwitchListTile(
              title: const Text(preferences_constants.keyEnableSecurity),
              value: preferencesService.getBoolean(preferences_constants.keyEnableSecurity),
              onChanged: (value) {
                setState(() {
                  preferencesService.putBoolean(preferences_constants.keyEnableSecurity, value);
                });
              },
            ),
          ],
        ));
  }
}
