import 'dart:async';

import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../app.dart';
import 'dao.dart';
import 'models/person.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Person])
abstract class FlutterDatabase extends FloorDatabase {
  PersonDao get dao;
}

class DBProvider {
  var database;
  var dao;

  DBProvider() {
    database =
        $FloorFlutterDatabase.databaseBuilder('app_database.db').build();
    dao = database.taskDao;
  }

  // Make Singleton
  DBProvider._();

  static final DBProvider db = DBProvider._();
}
