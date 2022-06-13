import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Authentication {
  static final auth = LocalAuthentication();

  static Future<bool> authenticate() async {
    final isAvaliable = await hasBiometrics();

    if(!isAvaliable) return false;

    try {
      return await auth.authenticate(
          localizedReason: 'Please authenticate to show your diagnostics',
          options: const AuthenticationOptions(
            useErrorDialogs: false,
            stickyAuth: true,
          ));
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> hasBiometrics() async{
    try {
      return await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }
}
