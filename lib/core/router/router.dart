import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_pokedex/core/services/services.dart';
import 'package:pocket_pokedex/presentation/app/app_authentication_wrapper.dart';
import 'package:pocket_pokedex/presentation/app/app_wrapper.dart';
import 'package:pocket_pokedex/presentation/authentication/login/cubit/login_cubit.dart';
import 'package:pocket_pokedex/presentation/authentication/login/login_page.dart';
import 'package:pocket_pokedex/presentation/home/home_page.dart';
import 'package:pocket_pokedex/presentation/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pocket_pokedex/presentation/pokemon_detail/pokemon_detail_page.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final GoRouter router = GoRouter(
  routes: $appRoutes,
  initialLocation: "/login",
);

@TypedShellRoute<AppShellRoute>(
  routes: [
    TypedGoRoute<LoginRoute>(path: '/login'),
    TypedShellRoute<AuthenticatedShellRoute>(
      routes: [
        TypedGoRoute<DashboardRoute>(path: '/home'),
        TypedGoRoute<PokemonDetailRoute>(path: '/pokemon/:pokemonId'),
      ],
    ),
  ],
)
class AppShellRoute extends ShellRouteData {
  const AppShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppWrapper(child: navigator);
  }
}

class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    //If already logged in then redirect to home
    if (services.authenticationService.currentAuthentication.isAuthenticated) {
      return DashboardRoute().location;
    }
    return super.redirect(context, state);
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      child: BlocProvider(
        create: (context) => LoginCubit(
          services.authenticationService,
          services.snackbarService,
        ),
        child: LoginPage(),
      ),
    );
  }
}

class AuthenticatedShellRoute extends ShellRouteData {
  const AuthenticatedShellRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (services
        .authenticationService.currentAuthentication.isUnauthenticated) {
      return LoginRoute().location;
    }
    return super.redirect(context, state);
  }

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppAuthenticationWrapper(child: navigator);
  }
}

class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: HomePage());
  }
}

class PokemonDetailRoute extends GoRouteData {
  const PokemonDetailRoute({required this.pokemonId, this.$extra});

  final int pokemonId;
  final String? $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      child: BlocProvider(
        create: (context) => PokemonDetailCubit(
          services.pokemonService,
          services.favoritesService,
          pokemonId: pokemonId,
        ),
        child: PokemonDetailPage(pokemonId: pokemonId),
      ),
    );
  }
}

