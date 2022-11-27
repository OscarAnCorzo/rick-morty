import 'package:rick_and_morty/src/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/src/core/usecase.dart';
import 'package:rick_and_morty/src/features/domain/entities/episode_entity.dart';
import 'package:rick_and_morty/src/features/domain/repositories/episodes_repository.dart';

class ListEpisodesUseCase extends UseCase<List<EpisodeEntity>, Map<String, dynamic>> {
  final EpisodesRepository _repository;

  ListEpisodesUseCase(this._repository);

  ///```dart
  /// params : {
  ///   'page': int,
  ///   'ids': List<int> 
  /// }
  ///```
  @override
  Future<Either<Failure, List<EpisodeEntity>>> call(Map<String, dynamic> params) async {
    return await _repository.getEpisodes(params);
  }
}