
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/src/core/failures.dart';
import 'package:rick_and_morty/src/core/http/api.dart';
import 'package:rick_and_morty/src/features/data/models/character_model.dart';
import 'package:rick_and_morty/src/features/data/models/episode_model.dart';
import 'package:rick_and_morty/src/features/data/models/paginated_response_model.dart';
import 'package:rick_and_morty/src/features/domain/entities/character_entity.dart';
import 'package:rick_and_morty/src/features/domain/entities/episode_entity.dart';

abstract class RemoteDataSource {
  Future<PaginatedResponseModel<CharacterEntity>> getCharacters(Map<String, dynamic> params);
  Future<List<CharacterEntity>> getInteresting(Map<String, dynamic> params);
  Future<List<EpisodeEntity>> getEpisodes(Map<String, dynamic> params);
}


class RemoteDataSourceImpl extends ApiProvider implements RemoteDataSource {

  @override
  Future<PaginatedResponseModel<CharacterEntity>> getCharacters(Map<String, dynamic> params) async {
    try {
      log('/character', name: 'GET');
      log(params.toString(), name:'GET-data');

      final resp = await dio!.get('/character', queryParameters: params);

      // log(resp.data);

      // Map<String,dynamic> body = resp.data['data'];
      List<CharacterEntity> list = List<CharacterEntity>.from(resp.data['results'].map((x) => CharacterModel.fromJson(x)));
      
      return PaginatedResponseModel.fromJson(resp.data['info'], list, params['page']);
    } on DioError catch (e) {
      if(e.response?.statusCode == 404) return PaginatedResponseModel.fromJson({}, [], params['page']);
      else throw ServerFailure(error: e).extract;
    }
  }

  @override
  Future<List<CharacterEntity>> getInteresting(Map<String, dynamic> params) async {
    try {
      log('/character', name: 'GET');
      log(params.toString(), name:'GET-data');

      final resp = await dio!.get('/character${params['ids'] == null ?'' :'/'+params['ids'].join(',')}');

      // log(resp.data);

      // Map<String,dynamic> body = resp.data['data'];
      List<CharacterEntity> list = List<CharacterEntity>.from(resp.data.map((x) => CharacterModel.fromJson(x)));
      
      return list;
    } on DioError catch (e) {
      if(e.response?.statusCode == 404) return [];
      else throw ServerFailure(error: e).extract;
    }
  }

  @override
  Future<List<EpisodeEntity>> getEpisodes(Map<String, dynamic> params) async {
    try {
      log('/episode', name: 'GET');
      log(params.toString(), name:'GET-data');

      final resp = await dio!.get('/episode${params['ids'] == null ?'' :'/'+params['ids'].join(',')}');

      List<EpisodeEntity> list = List<EpisodeEntity>.from(resp.data.map((x) => EpisodeModel.fromJson(x)));
      
      return list;
    } on DioError catch (e) {
      if(e.response?.statusCode == 404) return [];
      else throw ServerFailure(error: e).extract;
    }
  }
}