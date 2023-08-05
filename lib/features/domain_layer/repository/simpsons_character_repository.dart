 import 'package:anywhere_variant_one/core/resources/data_state.dart';
import 'package:anywhere_variant_one/features/domain_layer/entity/simpsons_character_entity.dart';

abstract class SimpsonsCharacterRepository{

  Future<DataState<SimpsonsCharacterEntity>>fetchSimpsonsCharacter();


}