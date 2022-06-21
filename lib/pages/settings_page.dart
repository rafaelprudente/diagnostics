import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../services/settings_service.dart';
import 'navigation_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsService settingsService = SettingsService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: settingsService.length(),
              itemBuilder: (BuildContext context, int index) {
                String key = settingsService.keys().elementAt(index);
                return SwitchListTile(
                  title: Text(key),
                  value: false,
                  onChanged: (value) {
                    setState(() {
                      settingsService.putBoolean(key, value);
                    });
                  },
                );
                //return SwitchListTile(
                //  title: Text(key),
                //  value: SettingsService().getBoolean(key),
                //  onChanged: (value) {
                //    setState(() {
                //      SettingsService().putBoolean(key, value);
                //    });
                //  },
                //);
              },
            )
          ],
        ),
      ),
    ));
  }
}
