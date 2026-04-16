part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class PokemonAddedEvent extends PokemonEvent {
  const PokemonAddedEvent({required this.id, required this.name});
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];
}
