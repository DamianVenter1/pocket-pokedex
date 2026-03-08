import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_pokedex/architecture/pokemon/entities/pokemon_detail.dart';
import 'package:pocket_pokedex/presentation/pokemon_detail/cubit/pokemon_detail_cubit.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) {
        final pokemon = state.pokemon;
        if (state.isLoading && pokemon == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.error != null && pokemon == null) {
          return _ErrorState(
            message: state.error!,
            onRetry: () => context.read<PokemonDetailCubit>().loadPokemon(),
          );
        }
        if (pokemon == null) {
          return const Center(child: Text('Pokemon not found.'));
        }
        return _PokemonDetailBody(pokemon: pokemon, isFavorite: state.isFavorite);
      },
    );
  }
}

class _PokemonDetailBody extends StatelessWidget {
  const _PokemonDetailBody({required this.pokemon, required this.isFavorite});

  final PokemonDetail pokemon;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () =>
                  context.read<PokemonDetailCubit>().toggleFavorite(),
            ),
          ),
          Center(
            child: Image.network(
              pokemon.imageUrl,
              height: 240,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, progress) {
                if (progress == null) {
                  return child;
                }
                return SizedBox(
                  height: 240,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: progress.expectedTotalBytes != null
                          ? progress.cumulativeBytesLoaded /
                                progress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 240,
                  child: Center(child: Icon(Icons.broken_image, size: 48)),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: pokemon.types
                .map((type) => _TypeChip(type: type))
                .toList(),
          ),
          const SizedBox(height: 16),
          Text('Description', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            pokemon.description.isNotEmpty
                ? pokemon.description
                : 'No description available.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          Text('Stats', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Column(
            children: pokemon.stats
                .map((stat) => _StatRow(stat: stat))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    final color = _typeColor(type);
    final textColor = _chipTextColor(color);
    return Chip(
      label: Text(_capitalize(type)),
      backgroundColor: color,
      labelStyle: TextStyle(color: textColor, fontWeight: FontWeight.w600),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.stat});

  final PokemonStat stat;

  @override
  Widget build(BuildContext context) {
    final value = stat.value.toDouble();
    final normalized = (value / 255).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              stat.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(value: normalized, minHeight: 10),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 36,
            child: Text(
              stat.value.toString(),
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            TextButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}

Color _typeColor(String type) {
  switch (type.toLowerCase()) {
    case 'fire':
      return const Color(0xFFF57D31);
    case 'water':
      return const Color(0xFF6493EB);
    case 'grass':
      return const Color(0xFF74CB48);
    case 'electric':
      return const Color(0xFFF9CF30);
    case 'ice':
      return const Color(0xFF9AD6DF);
    case 'fighting':
      return const Color(0xFFC12239);
    case 'poison':
      return const Color(0xFFA43E9E);
    case 'ground':
      return const Color(0xFFDEC16B);
    case 'flying':
      return const Color(0xFFA891EC);
    case 'psychic':
      return const Color(0xFFFB5584);
    case 'bug':
      return const Color(0xFFA7B723);
    case 'rock':
      return const Color(0xFFB69E31);
    case 'ghost':
      return const Color(0xFF70559B);
    case 'dragon':
      return const Color(0xFF7037FF);
    case 'dark':
      return const Color(0xFF75574C);
    case 'steel':
      return const Color(0xFFB7B9D0);
    case 'fairy':
      return const Color(0xFFE69EAC);
    case 'normal':
    default:
      return const Color(0xFFA8A77A);
  }
}

Color _chipTextColor(Color background) {
  return ThemeData.estimateBrightnessForColor(background) == Brightness.dark
      ? Colors.white
      : Colors.black;
}

String _capitalize(String value) {
  if (value.isEmpty) {
    return value;
  }
  return value[0].toUpperCase() + value.substring(1);
}
