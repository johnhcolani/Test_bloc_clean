import 'dart:async';

import 'package:anywhere_variant_one/core/resources/data_state.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/domain/usecase/get_simpsons_usecase.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/domain/usecase/save_simpson_usecase.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/presentation_layer/bloc/get_simpsons_status.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/presentation_layer/bloc/save_simpsons_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  GetSimpsonsUseCase getSimpsonsUseCase;
  SaveSimpsonsUseCase saveSimpsonsUseCase;

  BookmarkBloc(this.getSimpsonsUseCase, this.saveSimpsonsUseCase)
      : super(BookmarkState(
            getSimpsonsStatus: GetSimpsonsLoading(),
            saveSimpsonStatus: SaveSimpsonsInitial())) {
    on<GetSimpsonsByNameEvent>((event, emit) async {
      emit(state.copyWith(newGetSimpsonsStatus: GetSimpsonsLoading()));
      DataState dataState = await getSimpsonsUseCase(event.simpsonsName);
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newGetSimpsonsStatus: GetSimpsonsCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newGetSimpsonsStatus: GetSimpsonsError(dataState.error)));
      }
    });
    on<SaveSimpsonsEvent>((event, emit) async {
      emit(state.copyWith(newSaveSimpsonStatus: SaveSimpsonsLoading()));
      DataState dataState = await saveSimpsonsUseCase(event.name);
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newSaveSimpsonStatus: SaveSimpsonsCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newSaveSimpsonStatus: SaveSimpsonsError(dataState.error)));
      }
    });
    on<SaveSimpsonsInitialEvent>((event, emit) async {
      emit(state.copyWith(newSaveSimpsonStatus: SaveSimpsonsInitial()));
    });
  }
}
