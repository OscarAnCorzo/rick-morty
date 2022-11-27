
import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? specie;
  final String? type;
  final String? gender;
  final String? originName;
  final String? originUrl;
  final String? locationName;
  final String? locationUrl;
  final String? image;
  final List<String>? episodes;
  final String? url;

  const CharacterEntity({
    this.id,
    this.name,
    this.status,
    this.specie,
    this.type,
    this.gender,
    this.originName,
    this.locationName,
    this.image,
    this.episodes,
    this.url,
    this.originUrl,
    this.locationUrl
  });
  
  @override
  List<Object?> get props => [id, name, status,
    specie,
    type,
    gender,
    originName,
    locationName,
    image,
    episodes,
    url,
    originUrl,
    locationUrl
  ];
}