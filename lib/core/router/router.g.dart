// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$appShellRoute];

RouteBase get $appShellRoute => ShellRouteData.$route(
  factory: $AppShellRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/login',

      factory: $LoginRouteExtension._fromState,
    ),
    ShellRouteData.$route(
      factory: $AuthenticatedShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/home',

          factory: $DashboardRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/pokemon/:pokemonId',

          factory: $PokemonDetailRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $AppShellRouteExtension on AppShellRoute {
  static AppShellRoute _fromState(GoRouterState state) => const AppShellRoute();
}

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location('/login');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AuthenticatedShellRouteExtension on AuthenticatedShellRoute {
  static AuthenticatedShellRoute _fromState(GoRouterState state) =>
      const AuthenticatedShellRoute();
}

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  String get location => GoRouteData.$location('/home');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PokemonDetailRouteExtension on PokemonDetailRoute {
  static PokemonDetailRoute _fromState(GoRouterState state) =>
      PokemonDetailRoute(
        pokemonId: int.parse(state.pathParameters['pokemonId']!)!,
        $extra: state.extra as String?,
      );

  String get location => GoRouteData.$location(
    '/pokemon/${Uri.encodeComponent(pokemonId.toString())}',
  );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
