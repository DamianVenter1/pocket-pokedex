part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required List<Pokemon> pokemon,
    required bool isLoading,
    required String? error,
    required int totalCount,
    required bool hasNext,
    required Set<int> favoriteIds,
    required bool showOnlyFavorites,
    required String searchQuery,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    pokemon: [],
    isLoading: false,
    error: null,
    totalCount: 0,
    hasNext: false,
    favoriteIds: <int>{},
    showOnlyFavorites: false,
    searchQuery: '',
  );
}
