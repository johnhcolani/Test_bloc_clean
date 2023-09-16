part of 'simpsons_character_bloc.dart';

@immutable
class SimpsonsCharacterState extends Equatable{
  final ScStatus scStatus;

  const SimpsonsCharacterState({required this.scStatus});
SimpsonsCharacterState copyWith({
  ScStatus? newScStatus,
}){
  return SimpsonsCharacterState(
    scStatus: newScStatus ?? scStatus,
  );
}

  @override
    List<Object?> get props => [scStatus];
}

