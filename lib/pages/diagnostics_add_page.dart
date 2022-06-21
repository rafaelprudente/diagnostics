import 'package:diagnostics/pages/navigation_drawer.dart';
import 'package:flutter/material.dart';
import '../constants/general.dart' as constants;

class DiagnosticsAddPage extends StatefulWidget {
  const DiagnosticsAddPage({Key? key, required String title}) : super(key: key);

  @override
  State<DiagnosticsAddPage> createState() => _DiagnosticsAddPageState();
}

class _DiagnosticsAddPageState extends State<DiagnosticsAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text(constants.applicationName),
      ),
      body: const Center(
        child: Text('${constants.applicationName} - Add'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
