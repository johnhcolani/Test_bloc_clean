
import 'package:anywhere_variant_one/features/bookmark_feature/domain/entity/character_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../home_feature/domain_layer/entity/simpsons_character_entity.dart';



abstract class SaveSimpsonStatus extends Equatable{}

class SaveSimpsonsInitial extends SaveSimpsonStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class SaveSimpsonsLoading extends SaveSimpsonStatus{
  @override
    List<Object?> get props => [];

}
class SaveSimpsonsCompleted extends SaveSimpsonStatus{
  final Simpsons simpsons;

  SaveSimpsonsCompleted(this.simpsons);

  @override
  List<Object?> get props => [simpsons];
}
class SaveSimpsonsError extends SaveSimpsonStatus{
  final String message;

  SaveSimpsonsError(this.message);

  @override
   List<Object?> get props => [message];
}