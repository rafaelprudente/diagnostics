import 'package:diagnostics/constants/label_constants.dart' as label_constants;
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthenticationService extends GetxService {
  final LocalAuthentication authentication;

  LocalAuthenticationService({required this.authentication});

  Future<bool> isBiometricAvailable() async {
    final bool canAuthenticateWithBiometrics = await authentication.canCheckBiometrics;
    return canAuthenticateWithBiometrics || await authentication.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    return await authentication.authenticate(localizedReason: label_constants.labelAuthenticate);
  }

  Future<LocalAuthenticationService> init() async {
    return this;
  }
}
