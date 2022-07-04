import 'package:diagnostics/constants/database_constants.dart' as database_constants;
import 'package:diagnostics/data_sources/local/diagnostics_db_client_base.dart';

class DoctorsDbClient extends DiagnosticsDbClientBase {
  DoctorsDbClient() : super(table: database_constants.tbDoctors);
}
