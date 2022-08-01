part of 'character_cubit_cubit.dart';

@immutable
abstract class CharacterCubitState {}

class CharacterCubitInitial extends CharacterCubitState {}

class CharacterLoaded extends CharacterCubitState {
  final List<character> characters;

  CharacterLoaded(this.characters);
}

class CharacterQuateLoaded extends CharacterCubitState {
  final List<Qoate> quate;

  CharacterQuateLoaded(this.quate);
}

// search states

class SearchSuccessState extends CharacterCubitState {}

class SearchErrorState extends CharacterCubitState {}
class ChangeSearchState extends CharacterCubitState {}
