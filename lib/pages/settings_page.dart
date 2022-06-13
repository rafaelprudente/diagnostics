import 'package:diagnostics/api/settings.dart';
import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Settings settings = Settings();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(title: const Text('Diagnostics - Settings')),
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: settings.length(),
              itemBuilder: (BuildContext context, int index) {
                String key = settings.keys().elementAt(index);
                return SwitchListTile(
                  title: Text(key),
                  value: settings.getBool(key) ,
                  onChanged: (value) {
                    setState(() {
                      settings.setBool(key, value);
                    });
                  },
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
