import 'package:diagnostics/constants/database_constants.dart' as database_constants;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DiagnosticsDbClientBase {
  String table;

  DiagnosticsDbClientBase({required this.table}) {
    _database = _initDatabase();
  }

  //static final DiagnosticsDbClientBase instance = DiagnosticsDbClientBase.constructor();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, database_constants.dbName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE IF NOT EXISTS Doctors ( "Id" INTEGER NOT NULL CONSTRAINT "PK_Doctors" PRIMARY KEY AUTOINCREMENT,
                                                "Crm" INTEGER NOT NULL,
                                                "Name" TEXT NOT NULL,
                                                "Status" TEXT NULL,
                                                "Subscription" TEXT NULL,
                                                "Inactivation" TEXT NULL,
                                                "City" TEXT NULL,
                                                "Uf" TEXT NULL,
                                                "Specialties" TEXT NULL )''');
  }

  Future<int?> insert(Map<String, dynamic> row) async {
    //Database db = await instance.database;

    return await _database?.insert(table, row);
  }
}
