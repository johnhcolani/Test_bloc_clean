part of 'bookmark_bloc.dart';

@immutable
abstract class BookmarkEvent {}
class GetAllSimpsonsEvent extends BookmarkEvent{}

class GetSimpsonsByNameEvent extends BookmarkEvent{
  final String simpsonsName;

  GetSimpsonsByNameEvent(this.simpsonsName);
}
class SaveSimpsonsEvent extends BookmarkEvent{
  final String name;
  SaveSimpsonsEvent(this.name);
}
class SaveSimpsonsInitialEvent extends BookmarkEvent{

}
class DeleteSimpsonsEvent extends BookmarkEvent{
  final String name;

  DeleteSimpsonsEvent(this.name);
}