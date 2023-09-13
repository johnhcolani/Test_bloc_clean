
import 'dart:convert';

import 'package:anywhere_variant_one/core/resources/data_state.dart';

import 'package:dio/dio.dart';

import '../../domain_layer/entity/simpsons_character_entity.dart';
import '../../domain_layer/repository/simpsons_character_repository.dart';
import '../data_source/models/simpsons_character_model.dart';
import '../data_source/remote/api_provider.dart';

class SimpsonsCharacterRepositoryImpl extends SimpsonsCharacterRepository{
  ApiProvider apiProvider;

  SimpsonsCharacterRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<SimpsonsCharacterEntity>> fetchSimpsonsCharacter() async {
    try {
      Response response = await apiProvider.callSimpsonData();

      if( response.statusCode ==200) {
        SimpsonsCharacterEntity simpsonsCharacterEntity = SimpsonsCharacterModel
            .fromJson(jsonDecode(response.data));

        return DataSuccess(simpsonsCharacterEntity);
      }else{

        return DataFailed('Something went wrong');
      }
    }catch(e){
      print(e.toString());
      return DataFailed('Please check your connection');
    }
  }

}