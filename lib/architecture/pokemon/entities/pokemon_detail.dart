import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail.freezed.dart';

@freezed
abstract class PokemonDetail with _$PokemonDetail {
  const factory PokemonDetail({
    required int id,
    required String name,
    required String imageUrl,
    required String description,
    required List<String> types,
    required List<PokemonStat> stats,
  }) = _PokemonDetail;
}

@freezed
abstract class PokemonStat with _$PokemonStat {
  const factory PokemonStat({required String name, required int value}) =
      _PokemonStat;
}
