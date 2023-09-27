import 'package:anywhere_variant_one/features/bookmark_feature/domain/entity/character_entity.dart';
import 'package:equatable/equatable.dart';

abstract class GetSimpsonsStatus extends Equatable{}
class GetSimpsonsLoading extends GetSimpsonsStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GetSimpsonsCompleted extends GetSimpsonsStatus{
  final Simpsons simpsons;

  GetSimpsonsCompleted(this.simpsons);

  @override
  // TODO: implement props
  List<Object?> get props => [simpsons];

}

class GetSimpsonsError extends GetSimpsonsStatus{
  final String? message;

  GetSimpsonsError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}