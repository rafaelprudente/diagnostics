import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../services/local_auth_service.dart';

final providers = <SingleChildWidget>[
  Provider<LocalAuthService>(
    create: (context) => LocalAuthService(
      auth: LocalAuthentication(),
    ),
  ),
];