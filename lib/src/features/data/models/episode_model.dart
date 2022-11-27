
import 'package:rick_and_morty/src/features/domain/entities/episode_entity.dart';

class EpisodeModel extends EpisodeEntity {
  const EpisodeModel({
    int? id,
    String? name,
    String? airDate,
    String? episode,
    List<String>? characters
  }): super(
    id: id,
    name: name,
    airDate: airDate,
    episode: episode,
    characters: characters
  );


  factory EpisodeModel.fromJson(Map<String, dynamic> json){
    return EpisodeModel(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      episode: json['episode'],
      characters: List<String>.from((json['characters'] ?? []).map((x) => x.toString()))
    );
  }
}