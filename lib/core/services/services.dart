import 'package:pocket_pokedex/architecture/authentication/authentication_service.dart';
import 'package:pocket_pokedex/architecture/favorites/favorites_service.dart';
import 'package:pocket_pokedex/architecture/user/user_service.dart';
import 'package:pocket_pokedex/architecture/pokemon/pokemon_service.dart';
import 'package:pocket_pokedex/architecture/theme/theme_service.dart';
import 'package:pocket_pokedex/core/services/network_service.dart';
import 'package:pocket_pokedex/core/services/snackbar_service.dart';
import 'package:pocket_pokedex/core/services/storage/storage_service.dart';
import 'package:pocket_pokedex/core/services/storage/storage_service_local.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt services = GetIt.I;

Future<void> setupServices() async {
  services.registerSingleton<SnackbarService>(SnackbarService());
  services.registerSingleton<StorageService>(
    StorageServiceLocal(await SharedPreferences.getInstance()),
  );
  services.registerSingleton<ThemeService>(
    ThemeService(services.storageService),
  );
  services.registerSingleton<NetworkService>(
    NetworkService(services.storageService),
  );
  services.registerSingleton<AuthenticationService>(
    AuthenticationService(services.storageService),
  );
  services.registerSingleton<FavoritesService>(
    FavoritesService(services.storageService, services.authenticationService),
  );
  services.registerSingleton(
    UserService(
      services.storageService,
      services.authenticationService,
    ),
  );
  services.registerSingleton<PokemonService>(
    PokemonService(services.networkService),
  );
}

extension ServiceExtension on GetIt {
  SnackbarService get snackbarService => get<SnackbarService>();
  StorageService get storageService => get<StorageService>();
  ThemeService get themeService => get<ThemeService>();
  NetworkService get networkService => get<NetworkService>();
  AuthenticationService get authenticationService =>
      get<AuthenticationService>();
  FavoritesService get favoritesService => get<FavoritesService>();
  UserService get userService => get<UserService>();
  PokemonService get pokemonService => get<PokemonService>();
}
