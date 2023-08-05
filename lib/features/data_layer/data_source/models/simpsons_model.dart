import 'package:anywhere_variant_one/features/domain_layer/entity/simpsons_character_entity.dart';

class SimpsonsCharacter extends SimpsonsCharacterEntity{
  
  final String name;
  final String text;
  final String firstUrl;
  final String imageUrl;
  final String description;

  const SimpsonsCharacter({
      required this.name,
      required this.text,
      required this.firstUrl,
      required this.imageUrl,
      required this.description
}): super(
    name: name,
    text: text,
    firstUrl: firstUrl,
    imageUrl: imageUrl,
    description: description
  );

  factory SimpsonsCharacter.fromJson(dynamic json){
    return SimpsonsCharacter(
         name: json['name'],
      text: json['text'],
      firstUrl: json['firstUrl'],
      imageUrl: json['imageUrl'],
      description: json['description']
    );
  }


}
