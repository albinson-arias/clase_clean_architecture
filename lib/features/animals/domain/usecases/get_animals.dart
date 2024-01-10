import 'package:clase_clean_architecture/core/usecases/usecases.dart';
import 'package:clase_clean_architecture/core/utils/result.dart';
import 'package:clase_clean_architecture/features/animals/domain/entities/animal_entity.dart';
import 'package:clase_clean_architecture/features/animals/domain/repos/animal_repo.dart';

class GetAnimals extends FutureUsecaseWithoutParams<List<Animal>> {
  final AnimalRepo _repo;

  GetAnimals(this._repo);

  @override
  FutureResult<List<Animal>> call() => _repo.getAnimals();
}
