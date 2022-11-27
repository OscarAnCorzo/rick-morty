
import 'package:rick_and_morty/src/features/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    int? id,
    String? name,
    String? status,
    String? specie,
    String? type,
    String? gender,
    String? originName,
    String? locationName,
    String? originUrl,
    String? locationUrl,
    String? image,
    List<String>? episodes,
    String? url,
  }): super(
    id: id,
    name: name,
    status: status,
    specie: specie,
    type: type,
    gender: gender,
    originName: originName,
    locationName: locationName,
    originUrl: originUrl,
    locationUrl: locationUrl,
    image: image,
    episodes: episodes,
    url: url,
  );


  factory CharacterModel.fromJson(Map<String, dynamic> json){
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      specie: json['species'],
      type: json['type'],
      gender: json['gender'],
      originName: json['origin'] != null ?json['origin']['name'] :null,
      originUrl: json['origin'] != null ?json['origin']['url'] :null,
      locationName: json['location'] != null ?json['location']['name'] :null,
      locationUrl: json['location'] != null ?json['location']['url'] :null,
      image: json['image'],
      episodes: List<String>.from((json['episode'] ?? []).map<String>((x) => x.toString())),
      url: json['url'],
    );
  }
}