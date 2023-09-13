import 'package:equatable/equatable.dart';

import '../../data_layer/data_source/models/simpsons_character_model.dart';

class SimpsonsCharacterEntity extends Equatable {
  final String? abstract;
  final String? abstractSource;
  final String? abstractText;
  final String? abstractURL;
  final String? answer;
  final String? answerType;
  final String? definition;
  final String? definitionSource;
  final String? definitionURL;
  final String? entity;
  final String? heading;
  final String? image;
  final num? imageHeight;
  final num? imageIsLogo;
  final num? imageWidth;
  final String? infobox;
  final String? redirect;
  final List<RelatedTopics>? relatedTopics;
  final List<dynamic>? results;
  final String? type;
  final Meta? meta;
  const SimpsonsCharacterEntity(
      {
        this.abstract,
        this.abstractSource,
        this.abstractText,
        this.abstractURL,
        this.answer,
        this.answerType,
        this.definition,
        this.definitionSource,
        this.definitionURL,
        this.entity,
        this.heading,
        this.image,
        this.imageHeight,
        this.imageIsLogo,
        this.imageWidth,
        this.infobox,
        this.redirect,
        this.relatedTopics,
        this.results,
        this.type,
        this.meta,


});

  @override
  List<Object?> get props => [
    abstract,
    abstractSource,
    abstractText,
    abstractURL,
    answer,
    answerType,
    definition,
    definitionSource,
    definitionURL,
    entity,
    heading,
    image,
    imageHeight,
    imageIsLogo,
    imageWidth,
    infobox,
    redirect,
    relatedTopics,
    results,
    type,
    meta,

  ];
}
