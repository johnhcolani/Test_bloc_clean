import 'package:anywhere_variant_one/core/resources/data_state.dart';
import 'package:anywhere_variant_one/core/usecase/use_case.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/domain/repository/simpsons_repository.dart';

class DeleteSimpsonsUseCase implements UseCase<DataState<String>,String>{
  final SimpsonsRepository _simpsonsRepository;
  DeleteSimpsonsUseCase(this._simpsonsRepository);

  @override
  Future<DataState<String>> call(String param) {
   return _simpsonsRepository.deleteSimpsonsByName(param);
  }
  
  
}