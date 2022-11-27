
import 'package:equatable/equatable.dart';

class EpisodeEntity extends Equatable {
  final int? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final List<String>? characters;

  const EpisodeEntity({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters
  });


  @override
  List<Object?> get props => [id, name, airDate, episode,characters];
}