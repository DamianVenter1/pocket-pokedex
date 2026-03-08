import 'package:flutter/material.dart';
import 'package:pocket_pokedex/architecture/authentication/entities/authentication.dart';
import 'package:pocket_pokedex/core/services/services.dart';
import 'package:pocket_pokedex/presentation/app/widgets/snackbar_notifier.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;

  const AppWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: StreamBuilder<Authentication>(
            stream: services.authenticationService.stream,
            builder: (context, snapshot) {
              final auth = snapshot.data;
              if (auth == null || auth.isDetermining) {
                return const Center(child: CircularProgressIndicator());
              }

              return child;
            },
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: SnackbarNotifier(),
        ),
      ],
    );
  }
}
