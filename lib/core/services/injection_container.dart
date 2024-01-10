import 'package:clase_clean_architecture/features/animals/data/datasources/animal_remote_data_src.dart';
import 'package:clase_clean_architecture/features/animals/data/repos/animal_repo_impl.dart';
import 'package:clase_clean_architecture/features/animals/domain/repos/animal_repo.dart';
import 'package:clase_clean_architecture/features/animals/domain/usecases/get_animal.dart';
import 'package:clase_clean_architecture/features/animals/domain/usecases/get_animals.dart';
import 'package:clase_clean_architecture/features/animals/presentation/cubit/animal_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void inject() {
  sl
    // Cubit
    ..registerFactory(() => AnimalCubit(sl()))
    // Usecases
    ..registerLazySingleton(() => GetAnimal(sl()))
    ..registerLazySingleton(() => GetAnimals(sl()))
    // Repos
    ..registerLazySingleton<AnimalRepo>(() => AnimalRepoImpl(sl()))
    // Usecase
    ..registerLazySingleton<AnimalRemoteDataSrc>(
        () => AnimalRemoteDataSrcImpl());
}
