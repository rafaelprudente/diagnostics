import 'package:flutter/material.dart';
import '../general/constants.dart' as constants;

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(constants.applicationName),
      ),
      body: const Center(
        child: Text('Teste teste'),
      ),
    );;
  }
}
