import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class Simpsons extends Equatable {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;

  Simpsons({required this.name});

  @override
  List<Object?> get props => [name];
}
