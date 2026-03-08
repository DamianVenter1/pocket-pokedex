import 'package:fpdart/fpdart.dart';
import 'package:pocket_pokedex/architecture/pokemon/entities/pokemon.dart';
import 'package:pocket_pokedex/architecture/pokemon/entities/pokemon_detail.dart';
import 'package:pocket_pokedex/core/services/network_service.dart';

class PokemonListResponse {
  final List<Pokemon> results;
  final int count;
  final bool hasNext;
  final bool hasPrevious;

  PokemonListResponse({
    required this.results,
    required this.count,
    required this.hasNext,
    required this.hasPrevious,
  });
}

class PokemonService {
  PokemonService(this._networkService);

  final NetworkService _networkService;

  static const String _baseUrl = 'https://pokeapi.co/api/v2';

  static const List<String> _statOrder = [
    'hp',
    'attack',
    'defense',
    'special-attack',
    'special-defense',
    'speed',
  ];

  Future<Either<Exception, PokemonListResponse>> getPokemonList(
    int offset,
    int limit,
  ) async {
    final response = await _networkService.get(
      '$_baseUrl/pokemon',
      includeAuth: false,
      queryParameters: {'limit': limit, 'offset': offset},
    );

    return response.fold((l) => Left(l), (r) {
      final data = Map<String, dynamic>.from(r as Map);
      final parsed = _parseResponse(data);
      return Right(parsed);
    });
  }

  Future<Either<Exception, List<Pokemon>>> searchPokemon(String query) async {
    final trimmed = query.trim().toLowerCase();
    if (trimmed.isEmpty) {
      return const Right([]);
    }

    final response = await _networkService.get(
      '$_baseUrl/pokemon/$trimmed',
      includeAuth: false,
    );

    return response.fold(
      (l) {
        if (l.toString().contains('404') || l.toString().contains('Not Found')) {
          return const Right(<Pokemon>[]);
        }
        return Left(l);
      },
      (r) {
        final data = Map<String, dynamic>.from(r as Map);
        final id = data['id'] as int;
        final name = data['name'] as String;
        final pokemon = Pokemon(
          id: id,
          name: name,
          imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
        );
        return Right([pokemon]);
      },
    );
  }

  Future<Either<Exception, PokemonDetail>> getPokemonDetail(int id) async {
    final detailResponse = await _networkService.get(
      '$_baseUrl/pokemon/$id',
      includeAuth: false,
    );

    return await detailResponse.fold(
      (l) async => Left(l),
      (detailData) async {
        final detailMap = Map<String, dynamic>.from(detailData as Map);
        final speciesResponse = await _networkService.get(
          '$_baseUrl/pokemon-species/$id',
          includeAuth: false,
        );

        return speciesResponse.fold(
          (l) => Left(l),
          (speciesData) {
            final speciesMap = Map<String, dynamic>.from(speciesData as Map);
            return Right(
              PokemonDetail(
                id: detailMap['id'] as int,
                name: detailMap['name'] as String,
                imageUrl: _extractArtworkUrl(detailMap),
                description: _extractDescription(speciesMap),
                types: _parseTypes(detailMap),
                stats: _parseStats(detailMap),
              ),
            );
          },
        );
      },
    );
  }

  List<String> _parseTypes(Map<String, dynamic> data) {
    final rawTypes = (data['types'] as List<dynamic>? ?? [])
        .map((item) => Map<String, dynamic>.from(item as Map))
        .toList()
      ..sort(
        (a, b) => (a['slot'] as int).compareTo(b['slot'] as int),
      );

    return rawTypes
        .map(
          (item) =>
              (item['type'] as Map<String, dynamic>)['name'] as String,
        )
        .toList();
  }

  List<PokemonStat> _parseStats(Map<String, dynamic> data) {
    final statsByName = <String, PokemonStat>{};
    final stats = (data['stats'] as List<dynamic>? ?? [])
        .map((item) => Map<String, dynamic>.from(item as Map))
        .toList();

    for (final stat in stats) {
      final statData = Map<String, dynamic>.from(stat['stat'] as Map);
      final rawName = statData['name'] as String? ?? '';
      statsByName[rawName] = PokemonStat(
        name: _formatStatName(rawName),
        value: stat['base_stat'] as int? ?? 0,
      );
    }

    return _statOrder
        .where(statsByName.containsKey)
        .map((name) => statsByName[name]!)
        .toList();
  }

  String _formatStatName(String value) {
    switch (value) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'Attack';
      case 'defense':
        return 'Defense';
      case 'special-attack':
        return 'Sp. Atk';
      case 'special-defense':
        return 'Sp. Def';
      case 'speed':
        return 'Speed';
      default:
        return value;
    }
  }

  String _extractArtworkUrl(Map<String, dynamic> data) {
    final sprites = data['sprites'];
    if (sprites is! Map) {
      return '';
    }
    final other = sprites['other'];
    if (other is! Map) {
      return '';
    }
    final officialArtwork = other['official-artwork'];
    if (officialArtwork is! Map) {
      return '';
    }
    final url = officialArtwork['front_default'];
    return url is String ? url : '';
  }

  String _extractDescription(Map<String, dynamic> data) {
    final entries = data['flavor_text_entries'];
    if (entries is! List) {
      return '';
    }

    for (final entry in entries) {
      if (entry is! Map) {
        continue;
      }
      final language = entry['language'];
      if (language is! Map) {
        continue;
      }
      final languageName = language['name'];
      if (languageName == 'en') {
        final text = entry['flavor_text'];
        if (text is String) {
          return text.replaceAll(RegExp(r'[\n\f]+'), ' ').trim();
        }
      }
    }

    return '';
  }


  PokemonListResponse _parseResponse(Map<String, dynamic> data) {
    final results = (data['results'] as List<dynamic>)
        .map((item) => Pokemon.fromJson(Map<String, dynamic>.from(item as Map)))
        .toList();
    return PokemonListResponse(
      results: results,
      count: data['count'] as int,
      hasNext: data['next'] != null,
      hasPrevious: data['previous'] != null,
    );
  }
}
