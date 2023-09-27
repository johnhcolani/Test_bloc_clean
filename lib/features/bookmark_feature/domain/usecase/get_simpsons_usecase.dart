import 'package:anywhere_variant_one/core/resources/data_state.dart';
import 'package:anywhere_variant_one/core/usecase/use_case.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/domain/entity/character_entity.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/domain/repository/simpsons_repository.dart';

class GetSimpsonsUseCase implements UseCase<DataState<Simpsons?>,String>{
  final SimpsonsRepository _simpsonsRepository;

  GetSimpsonsUseCase(this._simpsonsRepository);

  @override
  Future<DataState<Simpsons?>> call(String param) {
    return _simpsonsRepository.findSimpsonsByName(param);
  }
}