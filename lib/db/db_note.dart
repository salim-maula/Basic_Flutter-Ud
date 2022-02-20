import 'package:flutter_only/model/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBNote {
  static const DATABASE_NAME = 'note.db';
  static const DATABASE_VERSION = 1;
  static const TABLE_NAME = 'tb_note';

  static const COLUMN_ID = 'id';
  static const COLUMN_TITLE = 'title';
  static const COLUMN_BODY = 'body';
  static const COLUMN_DATE = 'date';

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String databasePath = await getDatabasesPath();
    return await openDatabase(
      join(databasePath, DATABASE_NAME),
      version: DATABASE_VERSION,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $TABLE_NAME (                        
                $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,  
                $COLUMN_TITLE TEXT,
                $COLUMN_BODY TEXT,
                $COLUMN_DATE TEXT
              )
        ''');
      },
    );
  }

  Future<List<Note>> getAllNote() async {
    final db = await database;
    var notes = await db.query(TABLE_NAME, columns: [
      COLUMN_ID,
      COLUMN_TITLE,
      COLUMN_BODY,
      COLUMN_DATE,
    ]);

    List<Note> listNote = [];
    notes.forEach(
      (element) {
        listNote.add(Note.fromMap(element));
      },
    );
    return listNote;
  }

  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert(TABLE_NAME, note.toMap());
  }

  Future<int> updateWhereId(Note note) async {
    final db = await database;
    return await db.update(
      TABLE_NAME,
      note.toMap(),
      where: '$COLUMN_ID=?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteWhereId(int id) async {
    final db = await database;
    return await db.delete(
      TABLE_NAME,
      where: '$COLUMN_ID=?',
      whereArgs: [id],
    );
  }
}
