import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/core/utils/utils.dart';
import 'package:rick_and_morty/src/features/domain/entities/character_entity.dart';
import 'package:rick_and_morty/src/features/domain/entities/paginated_response.dart';
import 'package:rick_and_morty/src/features/domain/usecases/list_characters.usecase.dart';
import 'package:rick_and_morty/src/features/presentation/views/character_detail.view.dart';
import 'package:rick_and_morty/src/features/presentation/views/characters.view.dart';

class CharactersController extends GetxController {
  final ListCharactersUseCase _listCharacters;
  
  CharactersController({
    required ListCharactersUseCase listCharacters
  }): _listCharacters = listCharacters;

  
  bool loadingAll = true;
  bool loadingSearch = true;
  bool loadingNextPage = false;
  PaginatedResponse<CharacterEntity>? characters; 
  TextEditingController searchController = TextEditingController();
  String text = '';
  Timer? _debounce;
  String? filterBy;
  String? filterOption;

  @override
  void onInit() {
    super.onInit();

    getCharacters();
  }

  void getCharacters() async {
    if(this.characters == null) this.loadingAll = true;
    else this.loadingNextPage = true;

    update(['list']);

    Map<String, dynamic> params = {
      'page': this.characters == null
        ? 1
        : this.characters!.currentPage! + 1
    };

    if(this.searchController.text != '') params['name'] = this.searchController.text;
    if(this.filterBy != null && this.filterOption != null) params[this.filterBy!] = this.filterOption;

    this.text = this.searchController.text;

    final res = await _listCharacters.call(params);

    res.fold((l) {
      eitherError(l);
    }, (r) {
      if(this.characters == null) this.characters = r;
      else{
        List<CharacterEntity> temp = this.characters!.data!;
        temp.addAll(r.data!);

        this.characters = r;
        this.characters = this.characters!.copyWith(
          data: temp
        );
      }
    });

    if(this.loadingAll) this.loadingAll = false;
    else this.loadingNextPage = false;

    update(['list']);
  }


  void typing(){
    if(this.text != this.searchController.text){
      if(!this.loadingAll){
        this.loadingAll = true;
        update(['list']);
      }

      if (_debounce?.isActive ?? false) _debounce!.cancel();
        
      _debounce = Timer(Duration(milliseconds: 800), () {
        this.characters = null;

        getCharacters();
      });
    }
  }


  void filter({required String by, required String option}){
    this.filterBy = by;
    this.filterOption = option.toLowerCase();

    this.characters = null;
    getCharacters();
  }


  void deleteFilter(){
    this.filterBy = null;
    this.filterOption = null;
    this.text = '';
    this.searchController.text = '';

    this.characters = null;
    getCharacters();
  }


  goToCharacterView(CharacterEntity e){
    Get.to(() => CharacterDetailView(character: e));
  }
}