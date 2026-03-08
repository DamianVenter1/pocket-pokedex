import 'package:pocket_pokedex/architecture/authentication/entities/authentication.dart';
import 'package:pocket_pokedex/architecture/user/entities/user.dart';
import 'package:flutter/material.dart';

abstract interface class StorageService {
  Future<Authentication> getAuthentication();
  Future<void> setAuthentication(Authentication authentication);
  Future<void> removeAuthentication();

  Future<User?> getUser();
  Future<void> setUser(User user);
  Future<void> removeUser();

  Future<Set<int>> getFavorites(String userId);
  Future<void> setFavorites(String userId, Set<int> favoriteIds);

  Future<ThemeMode> getThemeMode();
  Future<void> setThemeMode(ThemeMode mode);
}
