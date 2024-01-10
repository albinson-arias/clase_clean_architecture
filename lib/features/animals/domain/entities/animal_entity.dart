import 'package:equatable/equatable.dart';

class Animal extends Equatable {
  final String id;
  final String name;

  const Animal({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
