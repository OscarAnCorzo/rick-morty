
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty/src/features/data/datasource/remote_datasource.dart';
import 'package:rick_and_morty/src/features/data/repositories/characters_repository_impl.dart';
import 'package:rick_and_morty/src/features/data/repositories/episodes_repository_impl.dart';
import 'package:rick_and_morty/src/features/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty/src/features/domain/repositories/episodes_repository.dart';
import 'package:rick_and_morty/src/features/domain/usecases/list_characters.usecase.dart';
import 'package:rick_and_morty/src/features/domain/usecases/list_episodes.usecase.dart';
import 'package:rick_and_morty/src/features/domain/usecases/list_interesting.usecase.dart';
import 'package:rick_and_morty/src/features/presentation/controllers/character_detail.controller.dart';
import 'package:rick_and_morty/src/features/presentation/controllers/characters_controller.dart';
import 'package:rick_and_morty/src/features/presentation/controllers/welcome_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerFactory(() => WelcomenController());
  sl.registerFactory(() => CharactersController(listCharacters: sl()));
  sl.registerFactory(() => CharacterDetailController(listEpisodes: sl(), listCharacters: sl()));

  sl.registerLazySingleton(() => ListCharactersUseCase(sl()));
  sl.registerLazySingleton(() => ListEpisodesUseCase(sl()));
  sl.registerLazySingleton(() => ListInterestingUseCase(sl()));

  sl.registerLazySingleton<CharactersRepository>(() => CharactersRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<EpisodesRepository>(() => EpisodesRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  await Hive.initFlutter();

  // adapters
  // Hive.registerAdapter(AuthAdapterAdapter());

  // Open Box
  // await Hive.openBox<ResidentialAdapter>(Collections.auth);

}