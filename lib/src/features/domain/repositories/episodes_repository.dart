
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/src/core/failures.dart';
import 'package:rick_and_morty/src/features/domain/entities/episode_entity.dart';

abstract class EpisodesRepository {
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes(Map<String, dynamic> params);
}