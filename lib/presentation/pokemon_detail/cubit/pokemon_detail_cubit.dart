import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_pokedex/architecture/pokemon/entities/pokemon_detail.dart';
import 'package:pocket_pokedex/architecture/pokemon/pokemon_service.dart';
import 'package:pocket_pokedex/architecture/favorites/favorites_service.dart';

part 'pokemon_detail_state.dart';
part 'pokemon_detail_cubit.freezed.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit(
    this._pokemonService,
    this._favoritesService, {
    required int pokemonId,
  })  : _pokemonId = pokemonId,
        super(PokemonDetailState.initial()) {
    _favoritesSubscription = _favoritesService.stream.listen(
      (favorites) => emit(
        state.copyWith(isFavorite: favorites.contains(_pokemonId)),
      ),
    );
    loadPokemon();
  }

  final PokemonService _pokemonService;
  final FavoritesService _favoritesService;
  final int _pokemonId;
  StreamSubscription<Set<int>>? _favoritesSubscription;

  Future<void> loadPokemon() async {
    emit(state.copyWith(isLoading: true, error: null));
    final response = await _pokemonService.getPokemonDetail(_pokemonId);
    response.fold(
      (l) => emit(state.copyWith(isLoading: false, error: l.toString())),
      (pokemon) =>
          emit(state.copyWith(isLoading: false, pokemon: pokemon, error: null)),
    );
  }

  Future<void> toggleFavorite() async {
    await _favoritesService.toggleFavorite(_pokemonId);
  }

  @override
  Future<void> close() {
    _favoritesSubscription?.cancel();
    return super.close();
  }
}
