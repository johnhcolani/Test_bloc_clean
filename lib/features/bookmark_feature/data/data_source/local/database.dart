// database.dart

// required package imports

import 'dart:async';

import 'package:anywhere_variant_one/features/bookmark_feature/data/data_source/local/character_dao.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/domain/entity/character_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Simpsons])
abstract class AppDatabase extends FloorDatabase {
  SimpsonsDao get simpsonsDao;
}