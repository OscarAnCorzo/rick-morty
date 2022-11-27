import 'package:rick_and_morty/src/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/src/core/usecase.dart';
import 'package:rick_and_morty/src/features/domain/entities/character_entity.dart';
import 'package:rick_and_morty/src/features/domain/entities/paginated_response.dart';
import 'package:rick_and_morty/src/features/domain/repositories/characters_repository.dart';

class ListCharactersUseCase extends UseCase<PaginatedResponse<CharacterEntity>, Map<String, dynamic>> {
  final CharactersRepository _repository;

  ListCharactersUseCase(this._repository);

  ///```dart
  /// params : {
  ///   'page': int,
  ///   'name': String //optional
  /// }
  ///```
  @override
  Future<Either<Failure, PaginatedResponse<CharacterEntity>>> call(Map<String, dynamic> params) async {
    return await _repository.getCharacters(params);
  }
}