import 'package:bloc/bloc.dart';
import 'package:clase_clean_architecture/core/utils/result.dart';
import 'package:clase_clean_architecture/features/animals/domain/entities/animal_entity.dart';
import 'package:clase_clean_architecture/features/animals/domain/usecases/get_animals.dart';
import 'package:equatable/equatable.dart';

part 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
  AnimalCubit(this._getAnimals) : super(AnimalInitial());

  final GetAnimals _getAnimals;

  Future<void> getAnimals() async {
    emit(AnimalsLoading());

    final result = await _getAnimals();

    result.fold(
      (success) => emit(AnimalsLoaded(success!)),
      (failure) => emit(AnimalsError(failure.message)),
    );
  }
}
