import 'package:equatable/equatable.dart';

class SimpsonsCharacterEntity extends Equatable {
  final String? name;
  final String? text;
  final String? firstUrl;
  final String? imageUrl;
  final String? description;
  const SimpsonsCharacterEntity(
      {this.name, this.text, this.firstUrl, this.imageUrl, this.description});

  @override
  List<Object?> get props => [];
}
