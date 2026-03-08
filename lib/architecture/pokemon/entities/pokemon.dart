import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';

@freezed
abstract class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required String imageUrl,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final url = json['url'] as String;
    final id = _extractId(url);
    return Pokemon(
      id: id,
      name: json['name'] as String,
      imageUrl: _spriteUrl(id),
    );
  }
}

int _extractId(String url) {
  final match = RegExp(r'/pokemon/(\d+)/').firstMatch(url);
  if (match != null) {
    return int.parse(match.group(1)!);
  }
  final segments = url
      .split('/')
      .where((segment) => segment.isNotEmpty)
      .toList();
  return int.parse(segments.last);
}

String _spriteUrl(int id) {
  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
}
