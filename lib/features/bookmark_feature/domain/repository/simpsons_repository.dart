

import 'package:anywhere_variant_one/features/bookmark_feature/domain/entity/character_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class SimpsonsRepository{
  Future<DataState<Simpsons>>saveSimpsonsToDB (String characterName);

  Future<DataState<List<Simpsons>>> getAllSimpsonsFromDB();

  Future<DataState<Simpsons?>> findSimpsonsByName(String name);

  Future<DataState<String>> deleteSimpsonsByName(String name);
  
}