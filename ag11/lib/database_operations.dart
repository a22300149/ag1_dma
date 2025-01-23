import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'student.dart';

class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String NAME = 'firstName';
  static const String LASTNAME = 'lastName';
  static const String TABLE = 'Students';
  static const String DB_NAME = 'student.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb(); //Metodo que crea la base de datos
      return _db!;
    }
  }

  //Metodo que inicializa la base de datos
  initDb() async {
    io.Directory appDirectory = await getApplicationDocumentsDirectory();
    String path = join(appDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  //Crear la base de datos
  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $NAME TEXT, $LASTNAME TEXT)");
  }

//inssert into (base de datos)
  Future<Student> save(Student student) async {
    var dbClient = await db;
    student.id = await dbClient.insert(TABLE, student.toMap());
    return student;
  }

//Select

  Future<List<Student>> getStudentss() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps =
        await dbClient.query(TABLE, columns: [ID, NAME, LASTNAME]);
    List<Student> studentss = [];
    print(maps.length);
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        studentss.add(Student.fromMap(maps[i]));
      }
    }
    return studentss;
  }

  //Delete
  Future<int> delete(int id) async {
    var dbClient = await db;

    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

//Update
  Future<int> update(Student student) async {
    var dbClient = await db;

    return await dbClient.update(TABLE, student.toMap(),
        where: '$ID = ?', whereArgs: [student.id]);
  }

  //cerrar base de datos
  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
