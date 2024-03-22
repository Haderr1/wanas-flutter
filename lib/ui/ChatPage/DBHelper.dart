import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'chat_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE messages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            text TEXT,
            isUserMessage INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertMessage(String text, bool isUserMessage) async {
    final Database db = await database;
    return await db.insert(
      'messages',
      {'text': text, 'isUserMessage': isUserMessage ? 1 : 0},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getMessages() async {
    final Database db = await database;
    return await db.query('messages');
  }

  Future<void> clearTable() async {
    final Database db = await database;
    await db.delete('messages');
  }
}
