import 'dart:async';

import 'package:pocket_pokedex/architecture/authentication/authentication_service.dart';
import 'package:pocket_pokedex/core/services/storage/storage_service.dart';
import 'package:rxdart/subjects.dart';

class FavoritesService {
  final StorageService _storageService;
  final AuthenticationService _authenticationService;
  late final BehaviorSubject<Set<int>> _controller;
  StreamSubscription? _authSubscription;

  FavoritesService(this._storageService, this._authenticationService) {
    _controller = BehaviorSubject.seeded(<int>{});
    _authSubscription = _authenticationService.stream
        .distinct(
          (previous, next) =>
              previous.token == next.token &&
              previous.isAuthenticated == next.isAuthenticated &&
              previous.isUnauthenticated == next.isUnauthenticated &&
              previous.isDetermining == next.isDetermining,
        )
        .listen((auth) async {
          if (auth.isAuthenticated) {
            await loadFavorites();
          } else {
            _controller.add(<int>{});
          }
        });

    if (_authenticationService.currentAuthentication.isAuthenticated) {
      loadFavorites();
    }
  }

  Stream<Set<int>> get stream => _controller.stream;

  Set<int> get currentFavorites => _controller.value;

  bool isFavorite(int pokemonId) => _controller.value.contains(pokemonId);

  Future<void> toggleFavorite(int pokemonId) async {
    final favorites = Set<int>.from(_controller.value);
    if (favorites.contains(pokemonId)) {
      favorites.remove(pokemonId);
    } else {
      favorites.add(pokemonId);
    }
    _controller.add(favorites);
    final userId = _authenticationService.currentAuthentication.token;
    if (userId.isNotEmpty) {
      await _storageService.setFavorites(userId, favorites);
    }
  }

  Future<void> loadFavorites() async {
    final userId = _authenticationService.currentAuthentication.token;
    if (userId.isEmpty) {
      _controller.add(<int>{});
      return;
    }
    final favorites = await _storageService.getFavorites(userId);
    _controller.add(favorites);
  }
}
