import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pocket_pokedex/firebase_options.dart';
import 'package:pocket_pokedex/core/router/router.dart';
import 'package:pocket_pokedex/core/services/services.dart';
import 'package:pocket_pokedex/presentation/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupServices();
  await services.themeService.loadThemeMode();

  services.authenticationService.stream.listen((auth) => router.refresh());

  runApp(const App());
}
