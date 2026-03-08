import 'package:flutter/material.dart';
import 'package:pocket_pokedex/core/router/router.dart';
import 'package:pocket_pokedex/core/theme/theme.dart';
import 'package:pocket_pokedex/core/services/services.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
      stream: services.themeService.stream,
      initialData: services.themeService.currentThemeMode,
      builder: (context, snapshot) {
        final themeMode = snapshot.data ?? ThemeMode.light;
        return MaterialApp.router(
          themeMode: themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          routerConfig: router,
        );
      },
    );
  }
}
