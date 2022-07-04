import 'package:diagnostics/constants/preferences_constants.dart' as preferences_constants;
import 'package:diagnostics/data_sources/local/preferences_db_client.dart';
import 'package:diagnostics/ui/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreferencesListPage extends StatefulWidget {
  const PreferencesListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PreferencesListPage> createState() => _PreferencesListPageState();
}

class _PreferencesListPageState extends State<PreferencesListPage> {
  final PreferencesDbClient preferencesDbClient = Get.find();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: widget.title,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ListView(
      children: <Widget>[
        SwitchListTile(
          title: const Text(preferences_constants.keyEnableSecurity),
          value: preferencesDbClient.getBoolean(preferences_constants.keyEnableSecurity),
          onChanged: (value) {
            setState(() {
              preferencesDbClient.putBoolean(preferences_constants.keyEnableSecurity, value);
            });
          },
        ),
      ],
    );
  }
}
