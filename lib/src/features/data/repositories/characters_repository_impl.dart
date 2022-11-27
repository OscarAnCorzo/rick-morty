
import 'package:rick_and_morty/src/features/data/datasource/remote_datasource.dart';
import 'package:rick_and_morty/src/features/domain/entities/paginated_response.dart';
import 'package:rick_and_morty/src/features/domain/entities/character_entity.dart';
import 'package:rick_and_morty/src/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/src/features/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  RemoteDataSource remoteDataSource;

  CharactersRepositoryImpl({
    required this.remoteDataSource
  });
  
  @override
  Future<Either<Failure, PaginatedResponse<CharacterEntity>>> getCharacters(Map<String, dynamic> params) async {
    try {
      final res = await remoteDataSource.getCharacters(params);

      return Right(res);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getInteresting(Map<String, dynamic> params) async {
    try {
      final res = await remoteDataSource.getInteresting(params);

      return Right(res);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
  
}