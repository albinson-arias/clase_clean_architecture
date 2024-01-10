import 'package:clase_clean_architecture/features/animals/data/models/animal_model.dart';

abstract interface class AnimalRemoteDataSrc {
  Future<List<AnimalModel>> getAnimals();

  Future<AnimalModel> getAnimal(String id);
}

class AnimalRemoteDataSrcImpl implements AnimalRemoteDataSrc {
  @override
  Future<AnimalModel> getAnimal(String id) async {
    return const AnimalModel(id: 'id', name: 'name');
  }

  @override
  Future<List<AnimalModel>> getAnimals() async {
    return [const AnimalModel(id: 'id', name: 'name')];
  }
}
