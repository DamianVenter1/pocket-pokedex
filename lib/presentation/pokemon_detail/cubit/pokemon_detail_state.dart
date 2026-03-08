part of 'pokemon_detail_cubit.dart';

@freezed
abstract class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    required PokemonDetail? pokemon,
    required bool isLoading,
    required String? error,
    required bool isFavorite,
  }) = _PokemonDetailState;

  factory PokemonDetailState.initial() => const PokemonDetailState(
        pokemon: null,
        isLoading: false,
        error: null,
        isFavorite: false,
      );
}
