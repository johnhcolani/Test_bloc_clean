import 'package:floor/floor.dart';

import '../../../domain/entity/character_entity.dart';

@dao
abstract class SimpsonsDao {
  @Query('SELECT * FROM Simpsons')
  Future<List<Simpsons>> getAllCharacter();

  @Query('SELECT * FROM Simpsons WHERE name = :name')
  Future<Simpsons?> findCharacterByName(String name);

  @insert
  Future<void> insertCharacter(Simpsons simpsons);

  @Query('DELETE FROM Simpsons WHERE name = :name')
  Future<void> deleteCiharacterByName(String name);
}
