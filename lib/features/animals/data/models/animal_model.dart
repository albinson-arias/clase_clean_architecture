import 'package:clase_clean_architecture/features/animals/domain/entities/animal_entity.dart';

class AnimalModel extends Animal {
  const AnimalModel({required super.id, required super.name});

  AnimalModel copyWith({
    String? id,
    String? name,
  }) {
    return AnimalModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
