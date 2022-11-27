import 'package:rick_and_morty/src/core/failures.dart';
import 'package:rick_and_morty/src/features/domain/entities/character_entity.dart';
import 'package:rick_and_morty/src/features/domain/entities/paginated_response.dart';
import 'package:dartz/dartz.dart';

abstract class CharactersRepository {
  Future<Either<Failure, PaginatedResponse<CharacterEntity>>> getCharacters(Map<String, dynamic> params);
  Future<Either<Failure, List<CharacterEntity>>> getInteresting(Map<String, dynamic> params);
}