import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;

  Future<Database> _getDatabase() async {
    if (_db != null) return _db!;
    final dbDirPath = await getDatabasesPath();
    final dbPath = join(dbDirPath, "student_db.db");
    _db = await openDatabase(
      dbPath,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE students(
            reg_no TEXT PRIMARY KEY, 
            name TEXT NOT NULL, 
            cell_no TEXT
          ) 
        ''');
      },
      version: 1,
    );
    return _db!;
  }

  Future<void> addStudent(String reg_no, String name, String cell_no) async {
    final db = await _getDatabase();
    await db.insert(
      "students",
      {"reg_no": reg_no, "name": name, "cell_no": cell_no},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await _getDatabase();
    return await db.query("students");
  }
}
