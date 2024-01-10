import 'package:clase_clean_architecture/core/errors/failure.dart';
import 'package:clase_clean_architecture/core/utils/result.dart';
import 'package:clase_clean_architecture/features/animals/data/datasources/animal_remote_data_src.dart';
import 'package:clase_clean_architecture/features/animals/domain/entities/animal_entity.dart';
import 'package:clase_clean_architecture/features/animals/domain/repos/animal_repo.dart';

class AnimalRepoImpl implements AnimalRepo {
  final AnimalRemoteDataSrc _remoteDataSrc;

  AnimalRepoImpl(this._remoteDataSrc);

  @override
  FutureResult<Animal> getAnimal(String id) async {
    try {
      final result = await _remoteDataSrc.getAnimal(id);
      return right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: '505'));
    }
  }

  @override
  FutureResult<List<Animal>> getAnimals() async {
    try {
      final result = await _remoteDataSrc.getAnimals();
      return right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: '505'));
    }
  }
}
