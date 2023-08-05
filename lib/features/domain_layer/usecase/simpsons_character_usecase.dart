
import 'package:anywhere_variant_one/core/resources/data_state.dart';
import 'package:anywhere_variant_one/core/usecase/use_case.dart';
import 'package:anywhere_variant_one/features/domain_layer/entity/simpsons_character_entity.dart';
import 'package:anywhere_variant_one/features/domain_layer/repository/simpsons_character_repository.dart';

class GetSimpsonsCharacterUseCase extends UseCase<DataState<SimpsonsCharacterEntity>, String>{
  final SimpsonsCharacterRepository simpsonsCharacterRepository;

  GetSimpsonsCharacterUseCase(this.simpsonsCharacterRepository);

  @override
  Future<DataState<SimpsonsCharacterEntity>> call(String param) {

    return simpsonsCharacterRepository.fetchSimpsonsCharacter();
  }
}