import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pocket_pokedex/architecture/authentication/entities/authentication.dart';
import 'package:pocket_pokedex/architecture/user/entities/user.dart';
import 'package:pocket_pokedex/core/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _keys = (
  authentication: "authentication",
  user: "user",
  favorites: "favorites",
  themeMode: "theme_mode",
);

String _favoritesKey(String userId) => "${_keys.favorites}_$userId";

const _themeModeLight = 'light';
const _themeModeDark = 'dark';
const _themeModeSystem = 'system';

String _themeModeToString(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.light:
      return _themeModeLight;
    case ThemeMode.dark:
      return _themeModeDark;
    case ThemeMode.system:
      return _themeModeSystem;
  }
}

ThemeMode _themeModeFromString(String? value) {
  switch (value) {
    case _themeModeLight:
      return ThemeMode.light;
    case _themeModeDark:
      return ThemeMode.dark;
    case _themeModeSystem:
      return ThemeMode.system;
    default:
      return ThemeMode.light;
  }
}

class StorageServiceLocal implements StorageService {
  final SharedPreferences _sharedPreferences;

  const StorageServiceLocal(this._sharedPreferences);

  @override
  Future<Authentication> getAuthentication() async {
    final value = _sharedPreferences.getString(_keys.authentication);
    if (value != null) {
      try {
        return Authentication.fromJson(jsonDecode(value));
      } catch (_) {
        return Authentication.unauthenticated();
      }
    } else {
      return Authentication.unauthenticated();
    }
  }

  @override
  Future<void> setAuthentication(Authentication authentication) async {
    await _sharedPreferences.setString(
      _keys.authentication,
      jsonEncode(authentication.toJson()),
    );
  }

  @override
  Future<void> removeAuthentication() async {
    await _sharedPreferences.remove(_keys.authentication);
  }

  @override
  Future<User?> getUser() async {
    final value = _sharedPreferences.getString(_keys.user);
    if (value != null) {
      try {
        return User.fromJson(jsonDecode(value));
      } catch (_) {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<void> removeUser() async {
    await _sharedPreferences.remove(_keys.user);
  }

  @override
  Future<void> setUser(User user) async {
    await _sharedPreferences.setString(
      _keys.user,
      jsonEncode(user.toJson()),
    );
  }

  @override
  Future<Set<int>> getFavorites(String userId) async {
    if (userId.isEmpty) {
      return <int>{};
    }
    final value = _sharedPreferences.getString(_favoritesKey(userId));
    if (value == null) {
      return <int>{};
    }
    try {
      final decoded = jsonDecode(value);
      if (decoded is List) {
        return decoded
            .whereType<num>()
            .map((value) => value.toInt())
            .toSet();
      }
    } catch (_) {
      return <int>{};
    }
    return <int>{};
  }

  @override
  Future<void> setFavorites(String userId, Set<int> favoriteIds) async {
    if (userId.isEmpty) {
      return;
    }
    await _sharedPreferences.setString(
      _favoritesKey(userId),
      jsonEncode(favoriteIds.toList()),
    );
  }

  @override
  Future<ThemeMode> getThemeMode() async {
    final value = _sharedPreferences.getString(_keys.themeMode);
    return _themeModeFromString(value);
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    await _sharedPreferences.setString(
      _keys.themeMode,
      _themeModeToString(mode),
    );
  }
}
