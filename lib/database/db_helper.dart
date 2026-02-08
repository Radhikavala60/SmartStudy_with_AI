import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/study_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'study.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE study(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            subject TEXT,
            hours INTEGER,
            priority TEXT
          )
        ''');
      },
    );
  }

  insertStudy(StudyModel model) async {
    final dbClient = await db;
    await dbClient.insert('study', model.toMap());
  }

  Future<List<Map<String, dynamic>>> getStudyList() async {
    final dbClient = await db;
    return await dbClient.query('study');
  }
}
