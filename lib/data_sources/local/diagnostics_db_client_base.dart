import 'package:diagnostics/constants/database_constants.dart' as database_constants;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DiagnosticsDbClientBase {
  String table;

  DiagnosticsDbClientBase({required this.table});

  static Database? _database;

  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database!;
  }

  initDatabase() async {
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
                                                "Specialties" TEXT NULL,
                                                "Email" TEXT NULL,
                                                "MobilePhone" TEXT NULL )''');
    await db.execute(
        '''CREATE TABLE IF NOT EXISTS Exams ( "Id" INTEGER NOT NULL CONSTRAINT "PK_Exams" PRIMARY KEY AUTOINCREMENT,
                                              "DoctorId" INTEGER NOT NULL,
                                              "Date" NUMERIC NOT NULL )''');
    await db.execute(
        '''CREATE TABLE IF NOT EXISTS ExamFiles ( "Id" INTEGER NOT NULL CONSTRAINT "PK_ExamFiles" PRIMARY KEY AUTOINCREMENT,
                                                  "Type" TEXT NOT NULL,
                                                  "FileData" BLOB NOT NULL )''');
  }

  Future<int?> insert(Map<String, dynamic> row) async {
    return await _database?.insert(table, row);
  }

  Future<List<Map<String, Object?>>?> getAll() async {
    return await _database?.query(table);
  }

  Future<List<Map<String, Object?>>?> getWhere(String where, List<dynamic> whereArguments) async {
    return await _database?.query(table, where: where, whereArgs: whereArguments);
  }

  Future<List<Map<String, Object?>>?> getById(int id) async {
    String whereString = 'Id = ?';
    List<dynamic> whereArguments = [id];
    return await _database?.query(table, where: whereString, whereArgs: whereArguments);
  }
}
