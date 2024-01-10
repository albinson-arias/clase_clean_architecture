import 'package:clase_clean_architecture/core/utils/result.dart';
import 'package:clase_clean_architecture/features/animals/domain/entities/animal_entity.dart';

abstract interface class AnimalRepo {
  FutureResult<List<Animal>> getAnimals();

  FutureResult<Animal> getAnimal(String id);
}
