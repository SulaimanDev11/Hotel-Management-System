import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _dbName = 'restaurant.db';
  static final _dbVersion = 1;
  static final _tableOne = 'datas';
  static final _tableTwo = 'portion';
  // static final _tableThree = 'my_table';
  //table 1
  static final dataId = 'dataId';
  static final dataName = 'dataName';
  static final dataPrice = 'dataPrice';
  static final portionId = 'portionId';
  //table 2
  static final portId = 'portionId';
  static final portName = 'postionName';

  //Making it singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initateDatabase();
    return _database!;
  }

  _initateDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate, onConfigure: _onConfigure);
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_tableOne (
            $dataId INTEGER PRIMARY KEY,
            $dataName TEXT NOT NULL,
            $dataPrice TEXT NOT NULL,
            $portionId INTEGER NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $_tableTwo (
            $portId INTEGER PRIMARY KEY,
            $portName TEXT NOT NULL
          )
          ''');
  }

  //query function return data in map form

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableOne, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableOne);
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $_tableOne'))!;
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[dataId];
    return await db
        .update(_tableOne, row, where: '$dataId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableOne, where: '$dataId = ?', whereArgs: [id]);
  }
}
