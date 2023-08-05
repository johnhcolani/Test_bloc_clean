import 'package:anywhere_variant_one/features/domain_layer/entity/simpsons_character_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ScStatus extends Equatable{}

class ScLoading extends ScStatus{
  @override
    List<Object?> get props => [];

}
class ScCompleted extends ScStatus{
  final SimpsonsCharacterEntity simpsonsCharacterEntity;

  ScCompleted(this.simpsonsCharacterEntity);

  @override
  List<Object?> get props => [simpsonsCharacterEntity];
}
class ScError extends ScStatus{
  final String message;

  ScError(this.message);

  @override
   List<Object?> get props => [message];
}