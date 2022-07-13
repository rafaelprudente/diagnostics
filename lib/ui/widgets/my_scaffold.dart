import 'package:diagnostics/ui/widgets/my_navigation_drawer.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final String title;
  final Widget? body;
  final Widget? floatingActionButton;

  const MyScaffold({Key? key, required this.title, this.body, this.floatingActionButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      right: true,
      left: true,
      child: Scaffold(
        drawer: const MyNavigationDrawer(),
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(padding: const EdgeInsets.all(8.0), child: body),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
