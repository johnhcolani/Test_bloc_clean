import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart';
import '../entity/character_entity.dart';
import '../repository/simpsons_repository.dart';

class GetAllSimpsonsUseCase implements UseCase<DataState<List<Simpsons>>,NoParams>{
  final SimpsonsRepository _simpsonsRepository;

  GetAllSimpsonsUseCase(this._simpsonsRepository);

  @override
  Future<DataState<List<Simpsons>>> call(NoParams param) {
    return _simpsonsRepository.getAllSimpsonsFromDB();
  }
}