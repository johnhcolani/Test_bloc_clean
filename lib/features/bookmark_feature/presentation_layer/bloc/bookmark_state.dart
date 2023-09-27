part of 'bookmark_bloc.dart';

class BookmarkState extends Equatable{
  GetSimpsonsStatus getSimpsonsStatus;
  SaveSimpsonStatus saveSimpsonStatus;

  BookmarkState({required this.getSimpsonsStatus, required this.saveSimpsonStatus});
  BookmarkState copyWith({
    GetSimpsonsStatus? newGetSimpsonsStatus,
    SaveSimpsonStatus? newSaveSimpsonStatus,
}){
   return BookmarkState(
       getSimpsonsStatus: newGetSimpsonsStatus ?? getSimpsonsStatus ,
       saveSimpsonStatus: newSaveSimpsonStatus ?? saveSimpsonStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [getSimpsonsStatus,saveSimpsonStatus];
}