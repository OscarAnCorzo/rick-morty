
import 'package:rick_and_morty/src/features/data/datasource/remote_datasource.dart';
import 'package:rick_and_morty/src/features/domain/entities/episode_entity.dart';
import 'package:rick_and_morty/src/features/domain/entities/paginated_response.dart';
import 'package:rick_and_morty/src/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/src/features/domain/repositories/episodes_repository.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  RemoteDataSource remoteDataSource;

  EpisodesRepositoryImpl({
    required this.remoteDataSource
  });
  
  @override
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes(Map<String, dynamic> params) async {
    try {
      final res = await remoteDataSource.getEpisodes(params);

      return Right(res);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
  
}