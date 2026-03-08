import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_pokedex/architecture/pokemon/entities/pokemon.dart';
import 'package:pocket_pokedex/architecture/pokemon/pokemon_service.dart';
import 'package:pocket_pokedex/architecture/favorites/favorites_service.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._pokemonService, this._favoritesService)
      : super(HomeState.initial()) {
    _favoritesSubscription = _favoritesService.stream.listen(
      (favorites) => emit(state.copyWith(favoriteIds: favorites)),
    );
  }

  final PokemonService _pokemonService;
  final FavoritesService _favoritesService;
  StreamSubscription<Set<int>>? _favoritesSubscription;
  Timer? _debounce;
  static const int _itemsPerPage = 20;

  Future<void> loadPokemon({bool reset = false}) async {
    if (state.isLoading) return;
    if (!reset && !state.hasNext) return;

    emit(state.copyWith(isLoading: true, error: null));

    final offset = reset ? 0 : state.pokemon.length;
    final response = await _pokemonService.getPokemonList(offset, _itemsPerPage);

    response.fold(
      (l) => emit(state.copyWith(isLoading: false, error: l.toString())),
      (r) => emit(
        state.copyWith(
          isLoading: false,
          pokemon: reset ? r.results : [...state.pokemon, ...r.results],
          totalCount: r.count,
          hasNext: r.hasNext,
          error: null,
        ),
      ),
    );
  }

  Future<void> loadMore() async {
    if (state.searchQuery.trim().isNotEmpty) return;
    if (state.showOnlyFavorites) return;
    await loadPokemon();
  }

  void search(String query) {
    _debounce?.cancel();
    emit(state.copyWith(searchQuery: query));

    _debounce = Timer(const Duration(milliseconds: 600), () async {
      final trimmed = query.trim();
      if (trimmed.isEmpty) {
        await loadPokemon(reset: true);
        return;
      }

      emit(
        state.copyWith(
          isLoading: true,
          error: null,
        ),
      );

      final response = await _pokemonService.searchPokemon(trimmed);
      response.fold(
        (l) => emit(state.copyWith(isLoading: false, error: l.toString())),
        (results) => emit(
          state.copyWith(
            isLoading: false,
            pokemon: results,
            totalCount: results.length,
            error: null,
          ),
        ),
      );
    });
  }

  Future<void> toggleFavorite(int pokemonId) async {
    await _favoritesService.toggleFavorite(pokemonId);
  }

  void toggleShowOnlyFavorites() {
    emit(state.copyWith(showOnlyFavorites: !state.showOnlyFavorites));
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    _favoritesSubscription?.cancel();
    return super.close();
  }
}
