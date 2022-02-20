import 'package:flutter_only/model/animal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBAnimal{
  static const DATABASE_NAME = 'animal.db';
  static const DATABASE_VERSION = 1;
  static const TABLE_NAME = 'tb_bookmark';

  static const COLUMN_NAME = 'name';
  static const COLUMN_IMAGE = 'image';
  static const COLUMN_MOVE = 'move';
  static const COLUMN_WEIGHT = 'weight';

  Database _database;

  //ini merupakan method untuk membuat databasenya
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
                $COLUMN_NAME TEXT,  
                $COLUMN_IMAGE TEXT,
                $COLUMN_MOVE INTEGER,
                $COLUMN_WEIGHT REAL
              )
        ''');
      },
    );
  }

  Future<List<Animal>> getAllAnimal() async {
    final db = await database;
    var animals = await db.query(TABLE_NAME, columns: [
      COLUMN_NAME,
      COLUMN_IMAGE,
      COLUMN_MOVE,
      COLUMN_WEIGHT,
    ]);

    List<Animal> listAnimal = [];
    animals.forEach(
      (element) {
        listAnimal.add(Animal.fromMap(element));
      },
    );
    return listAnimal;
  }

  Future<bool> checkAnimal(String name) async {
    final db = await database;
    var animals = await db.query(
      TABLE_NAME,
      columns: [
        COLUMN_NAME,
        COLUMN_IMAGE,
        COLUMN_MOVE,
        COLUMN_WEIGHT,
      ],
      where: '$COLUMN_NAME=?',
      whereArgs: [name],
    );

    if (animals.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<int> insertAnimal(Animal animal) async {
    final db = await database;
    return await db.insert(TABLE_NAME, animal.toMap());
  }

  Future<int> deleteWhereName(String name) async {
    final db = await database;
    return await db.delete(
      TABLE_NAME,
      where: '$COLUMN_NAME=?',
      whereArgs: [name],
    );
  }
}