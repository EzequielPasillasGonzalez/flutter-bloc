import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState()) {
    on<PokemonAddedEvent>(_pokemonAddedEvent);
  }

  Future<String> fetchPokemonName(int id) async {
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }

    try {
      final pokemonName = await PokemonInformation.getPokemonName(id);

      add(PokemonAddedEvent(id: id, name: pokemonName));

      return pokemonName;
    } catch (e) {
      throw Exception('Failed to fetch pokemon name');
    }
  }

  void _pokemonAddedEvent(PokemonAddedEvent event, Emitter<PokemonState> emit) {
    final newPokemons = Map<int, String>.from(state.pokemons);
    newPokemons[event.id] = event.name;

    emit(state.copyWith(pokemons: newPokemons));
  }
}
