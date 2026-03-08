import 'package:flutter/material.dart';
import 'package:pocket_pokedex/architecture/pokemon/entities/pokemon.dart';
import 'package:pocket_pokedex/core/router/router.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({
    super.key,
    required this.pokemon,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  final Pokemon pokemon;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () =>
            PokemonDetailRoute(pokemonId: pokemon.id, $extra: pokemon.name)
                .push(context),
        leading: Image.network(
          pokemon.imageUrl,
          width: 56,
          height: 56,
          fit: BoxFit.contain,
        ),
        title: Text(_capitalize(pokemon.name)),
        trailing: IconButton(
          onPressed: onFavoriteToggle,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Theme.of(context).colorScheme.error : null,
          ),
        ),
      ),
    );
  }
}

String _capitalize(String value) {
  if (value.isEmpty) {
    return value;
  }
  return value[0].toUpperCase() + value.substring(1);
}
