import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'photo.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database _db;
  static const String Id = 'id';
  static const String PHOTONAME = 'PhotoName';
  static const String TABLE = 'photos';
  static const String DB_NAME = 'photos.db';

  //creacion de la BD
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

  initDB() async {
    io.Directory appdirectory = await getApplicationDocumentsDirectory();
    print(appdirectory);
    String path = join(appdirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE($Id INTEGER PRIMARY KEY, $PHOTONAME TEXT)");
  }

  //OPERACIONES FUNDAMENTALES
  //Select
  Future<List<Photo>> getPhotos()async{
    var dbClient = await db;
    List <Map> maps = await dbClient.query(TABLE, columns: [Id,PHOTONAME]);
    List<Photo> photoss = [];
    if(maps.length >0){
      for(int i =0; i<maps.length; i++){
        photoss.add(Photo.fromMap(maps[i]));
      }
    }
  }

  //insert


}
