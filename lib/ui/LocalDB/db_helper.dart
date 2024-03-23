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
      version: 2, // Updated version number
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE messages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            text TEXT,
            isUserMessage INTEGER
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Perform the migration to add new columns
          await db.execute('ALTER TABLE messages ADD COLUMN chatid INTEGER;');
          await db.execute('ALTER TABLE messages ADD COLUMN personaid INTEGER;');
        }
      },
    );
  }

  Future<int> insertMessage(String text, bool isUserMessage, int chatid, int personaid) async {
    final Database db = await database;
    return await db.insert(
      'messages',
      {'text': text, 'isUserMessage': isUserMessage ? 1 : 0, 'chatid': chatid, 'personaid': personaid},
    );
  }

  Future<List<Map<String, dynamic>>> getMessages(int chatid, int personaid) async {
    final Database db = await database;
    return await db.query('messages', where: 'chatid = ? AND personaid = ?', whereArgs: [chatid, personaid]);
  }

  Future<void> clearMessages(int chatid, int personaid) async {
    final Database db = await database;
    await db.delete(
      'messages',
      where: 'chatid = ? AND personaid = ?',
      whereArgs: [chatid, personaid],
    );
  }
}
