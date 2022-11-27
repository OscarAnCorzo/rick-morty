import 'package:rick_and_morty/src/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/src/core/usecase.dart';
import 'package:rick_and_morty/src/features/domain/entities/character_entity.dart';
import 'package:rick_and_morty/src/features/domain/repositories/characters_repository.dart';

class ListInterestingUseCase extends UseCase<List<CharacterEntity>, Map<String, dynamic>> {
  final CharactersRepository _repository;

  ListInterestingUseCase(this._repository);

  ///```dart
  /// params : {
  ///   'page': int,
  ///   'ids': List<int> 
  /// }
  ///```
  @override
  Future<Either<Failure, List<CharacterEntity>>> call(Map<String, dynamic> params) async {
    return await _repository.getInteresting(params);
  }
}