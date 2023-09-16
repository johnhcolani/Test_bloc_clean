import 'dart:async';

import 'package:anywhere_variant_one/core/resources/data_state.dart';
import 'package:anywhere_variant_one/features/home_feature/presentation_layer/bloc/simpsons_status.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain_layer/usecase/simpsons_character_usecase.dart';




part 'simpsons_character_event.dart';
part 'simpsons_character_state.dart';

class SimpsonsCharacterBloc
    extends Bloc<SimpsonsCharacterEvent, SimpsonsCharacterState> {
  final GetSimpsonsCharacterUseCase getSimpsonsCharacterUseCase;
  SimpsonsCharacterBloc(this.getSimpsonsCharacterUseCase)
      : super(SimpsonsCharacterState(
          scStatus: ScLoading(),
        )) {
    on<LoadScEvent>((event, emit) async {
      emit(state.copyWith(newScStatus: ScLoading()));

      DataState dataState = await getSimpsonsCharacterUseCase(event.toString());
      if (dataState is DataSuccess) {
        emit(state.copyWith(newScStatus: ScCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(newScStatus: ScError(dataState.error!)));
      }
    });
  }
}
