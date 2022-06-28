import 'package:diagnostics/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class DoctorAddPage extends StatefulWidget {
  const DoctorAddPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DoctorAddPage> createState() => _DoctorAddPageState();
}

class _DoctorAddPageState extends State<DoctorAddPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Home - You have pushed the button this many times:',
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
      ),
    );
  }
}
