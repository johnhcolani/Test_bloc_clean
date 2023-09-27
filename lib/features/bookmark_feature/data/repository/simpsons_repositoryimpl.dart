
import 'package:anywhere_variant_one/core/resources/data_state.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/data/data_source/local/character_dao.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/domain/entity/character_entity.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/domain/repository/simpsons_repository.dart';

class SimpsonSRepositoryImpl extends SimpsonsRepository{
  SimpsonsDao simpsonsDao;

  SimpsonSRepositoryImpl(this.simpsonsDao);

  @override
  Future<DataState<String>> deleteSimpsonsByName(String name) async {
   try{
     await simpsonsDao.deleteCiharacterByName(name);
     return DataSuccess(name);
   }catch (e){
     print(e.toString());
     return DataFailed(e.toString());
   }
  }

  @override
  Future<DataState<Simpsons?>> findSimpsonsByName(String name) async{
  try{
    Simpsons? simpsons= await simpsonsDao.findCharacterByName(name);
    return DataSuccess(simpsons);
  }catch(e){
    print(e.toString());
    return DataFailed(e.toString());
  }
  }

  @override
  Future<DataState<List<Simpsons>>> getAllSimpsonsFromDB() async{
    try{
      List<Simpsons> simpsons =await simpsonsDao.getAllCharacter();
      return DataSuccess(simpsons);
    }catch(e){
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<Simpsons>> saveSimpsonsToDB(String characterName) async{
   try{
     Simpsons? checkSimpsons = await simpsonsDao.findCharacterByName(characterName);
     if(checkSimpsons != null){
       return DataFailed('$characterName has already exist');
     }
     Simpsons simpsons = Simpsons(name: characterName);
     await simpsonsDao.insertCharacter(simpsons);
     return DataSuccess(simpsons);
   } catch(e){
     print((e.toString()));
     return DataFailed(e.toString());
   }
  }

}