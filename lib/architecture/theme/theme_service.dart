import 'package:flutter/material.dart';
import 'package:pocket_pokedex/core/services/storage/storage_service.dart';
import 'package:rxdart/subjects.dart';

class ThemeService {
  final StorageService _storageService;
  late final BehaviorSubject<ThemeMode> _controller;

  ThemeService(this._storageService) {
    _controller = BehaviorSubject.seeded(ThemeMode.light);
  }

  Stream<ThemeMode> get stream => _controller.stream;

  ThemeMode get currentThemeMode => _controller.value;

  Future<void> loadThemeMode() async {
    final storedMode = await _storageService.getThemeMode();
    _controller.add(storedMode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _controller.add(mode);
    await _storageService.setThemeMode(mode);
  }

  Future<void> toggleTheme() async {
    final nextMode = currentThemeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    await setThemeMode(nextMode);
  }
}
