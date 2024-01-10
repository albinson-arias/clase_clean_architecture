part of 'animal_cubit.dart';

sealed class AnimalState extends Equatable {
  const AnimalState();

  @override
  List<Object> get props => [];
}

final class AnimalInitial extends AnimalState {}

final class AnimalsLoading extends AnimalState {}

final class AnimalsLoaded extends AnimalState {
  final List<Animal> animals;

  const AnimalsLoaded(this.animals);

  @override
  List<Object> get props => [animals];
}

final class AnimalsError extends AnimalState {
  final String message;

  const AnimalsError(this.message);

  @override
  List<Object> get props => [message];
}
