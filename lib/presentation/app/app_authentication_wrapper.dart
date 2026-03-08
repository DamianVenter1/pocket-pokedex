import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_pokedex/architecture/user/entities/user.dart';
import 'package:pocket_pokedex/core/services/services.dart';

class AppAuthenticationWrapper extends StatelessWidget {
  final Widget child;

  const AppAuthenticationWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: services.userService.stream,
      builder: (context, snapshot) {
        final user = snapshot.data;
        if (user == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final routerState = GoRouterState.of(context);
        final path = routerState.uri.path;
        final isHome = path == '/home';
        final isPokemonDetail = path.startsWith('/pokemon/');
        final title = isHome
            ? 'Pocket Pokedex'
            : isPokemonDetail
                ? _pokemonTitle(routerState.extra as String?)
                : 'Pocket Pokedex';
        final showBackButton = !isHome;
        final themeMode = services.themeService.currentThemeMode;
        final isDarkMode = themeMode == ThemeMode.dark;
        return Scaffold(
          appBar: AppBar(
            leading: showBackButton
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                  )
                : null,
            automaticallyImplyLeading: showBackButton,
            title: Text(title),
            actions: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.account_circle),
                onSelected: (value) {
                  if (value == 'logout') {
                    services.authenticationService.logout();
                  }
                  if (value == 'theme') {
                    services.themeService.toggleTheme();
                  }
                },
                itemBuilder: (context) {
                  final iconColor = Theme.of(context).colorScheme.onSurface;
                  return [
                    PopupMenuItem(
                      value: 'theme',
                      child: Row(
                        children: [
                          Icon(
                            isDarkMode
                                ? Icons.light_mode
                                : Icons.dark_mode,
                            color: iconColor,
                          ),
                          const SizedBox(width: 8),
                          Text(isDarkMode ? 'Light Mode' : 'Dark Mode'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'logout',
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: iconColor),
                          const SizedBox(width: 8),
                          const Text('Logout'),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ],
          ),
          body: child,
        );
      },
    );
  }
}

String _pokemonTitle(String? name) {
  if (name == null) {
    return 'Pokemon Details';
  }
  final trimmed = name.trim();
  if (trimmed.isEmpty) {
    return 'Pokemon Details';
  }
  return _capitalize(trimmed);
}

String _capitalize(String value) {
  if (value.isEmpty) {
    return value;
  }
  return value[0].toUpperCase() + value.substring(1);
}

