import 'dart:math';

import 'package:get/get.dart';
import 'package:rick_and_morty/src/core/utils/utils.dart';
import 'package:rick_and_morty/src/features/domain/entities/character_entity.dart';
import 'package:rick_and_morty/src/features/domain/entities/episode_entity.dart';
import 'package:rick_and_morty/src/features/domain/usecases/list_episodes.usecase.dart';
import 'package:rick_and_morty/src/features/domain/usecases/list_interesting.usecase.dart';
import 'package:rick_and_morty/src/features/presentation/views/character_detail.view.dart';

class CharacterDetailController extends GetxController {
  final ListEpisodesUseCase _listEpisodes;
  final ListInterestingUseCase _listCharacters;

  CharacterDetailController({
    required ListEpisodesUseCase listEpisodes,
    required ListInterestingUseCase listCharacters
  }): _listEpisodes = listEpisodes,
      _listCharacters = listCharacters;

  bool loadingEpisodes = true;
  bool loadingCharacters = true;
  List<EpisodeEntity>? episodes;
  List<CharacterEntity>? characters;

  void getEpisodes(CharacterEntity character) async {
    Map<String, dynamic> params = {
      'ids': (character.episodes ?? []).map((x) => x.split('/').last)
    };

    final resp = await this._listEpisodes.call(params);

    resp.fold((l) {
      eitherError(l);
    }, (r) {
      this.episodes = r;
    });

    this.loadingEpisodes = false;

    update(['episodes']);
  }


  void getCharacters() async {
    Map<String, dynamic> params = {
      'ids': [0,1,3].map((x) => Random().nextInt(100))
    };

    final resp = await this._listCharacters.call(params);

    resp.fold((l) {
      eitherError(l);
    }, (r) {
      this.characters = r;
    });

    this.loadingCharacters = false;

    update(['characters']);
  }

  goToCharacterView(CharacterEntity e){
    Get.to(() => CharacterDetailView(character: e));
  }
}