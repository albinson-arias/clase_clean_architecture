import 'package:clase_clean_architecture/core/usecases/usecases.dart';
import 'package:clase_clean_architecture/core/utils/result.dart';
import 'package:clase_clean_architecture/features/animals/domain/entities/animal_entity.dart';
import 'package:clase_clean_architecture/features/animals/domain/repos/animal_repo.dart';

class GetAnimal extends FutureUsecaseWithParams<Animal, String> {
  final AnimalRepo _repo;

  GetAnimal(this._repo);

  @override
  FutureResult<Animal> call(String params) => _repo.getAnimal(params);
}
