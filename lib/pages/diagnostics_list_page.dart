import 'package:diagnostics/pages/navigation_drawer.dart';
import 'package:flutter/material.dart';
import '../general/constants.dart' as constants;

class DiagnosticsListPage extends StatefulWidget {
  const DiagnosticsListPage({Key? key, required String title})
      : super(key: key);

  @override
  State<DiagnosticsListPage> createState() => _DiagnosticsListPageState();
}

class _DiagnosticsListPageState extends State<DiagnosticsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text(constants.applicationName),
      ),
      body: const Center(
        child: Text('Teste teste'),
      ),
    );
  }
}
