import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_pokedex/core/services/services.dart';
import 'package:pocket_pokedex/presentation/home/cubit/home_cubit.dart';
import 'package:pocket_pokedex/presentation/home/widgets/pokemon_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(services.pokemonService, services.favoritesService)
            ..loadPokemon(reset: true),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatefulWidget {
  const _HomePageContent();

  @override
  State<_HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<_HomePageContent> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      context.read<HomeCubit>().loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final filteredPokemon = state.showOnlyFavorites
            ? state.pokemon
                .where((pokemon) => state.favoriteIds.contains(pokemon.id))
                .toList()
            : state.pokemon;
        final showBottomLoader =
            state.isLoading && state.pokemon.isNotEmpty;
        final itemCount =
            filteredPokemon.length + (showBottomLoader ? 1 : 0);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) => context.read<HomeCubit>().search(value),
                decoration: const InputDecoration(
                  hintText: 'Search Pokemon',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FilterChip(
                  label: const Text('Show Favorites Only'),
                  selected: state.showOnlyFavorites,
                  onSelected: (_) =>
                      context.read<HomeCubit>().toggleShowOnlyFavorites(),
                ),
              ),
            ),
            if (state.isLoading && state.pokemon.isEmpty)
              const LinearProgressIndicator(),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (state.error != null) {
                    return Center(child: Text(state.error!));
                  }
                  if (state.showOnlyFavorites &&
                      state.favoriteIds.isEmpty &&
                      !state.isLoading) {
                    return const Center(child: Text('No favorites yet.'));
                  }
                  if (filteredPokemon.isEmpty && !state.isLoading) {
                    return const Center(child: Text('No Pokemon found.'));
                  }
                  return ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      if (index >= filteredPokemon.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      final pokemon = filteredPokemon[index];
                      return PokemonTile(
                        pokemon: pokemon,
                        isFavorite: state.favoriteIds.contains(pokemon.id),
                        onFavoriteToggle: () =>
                            context.read<HomeCubit>().toggleFavorite(
                              pokemon.id,
                            ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

