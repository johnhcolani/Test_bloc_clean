
import 'package:anywhere_variant_one/core/resources/data_state.dart';
import 'package:anywhere_variant_one/features/data_layer/data_source/remote/api_provider.dart';
import 'package:anywhere_variant_one/features/domain_layer/entity/simpsons_character_entity.dart';
import 'package:anywhere_variant_one/features/domain_layer/repository/simpsons_character_repository.dart';
import 'package:dio/dio.dart';

import '../data_source/models/simpsons_character_model.dart';

class SimpsonsCharacterRepositoryImpl extends SimpsonsCharacterRepository{
  ApiProvider apiProvider;

  SimpsonsCharacterRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<SimpsonsCharacterEntity>> fetchSimpsonsCharacter() async {
    try {
      Response response = await apiProvider.callSimpsonData();
      if( response.statusCode ==200) {
        SimpsonsCharacterEntity simpsonsCharacterEntity = SimpsonsCharacterModel
            .fromJson(response.data);
        return DataSuccess(simpsonsCharacterEntity);
      }else{
        return DataFailed('Something went wrong');
      }
    }catch(e){
      return DataFailed('Please check your connection');
    }
  }

}