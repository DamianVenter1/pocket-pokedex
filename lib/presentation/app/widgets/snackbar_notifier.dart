import 'package:flutter/material.dart';
import 'package:pocket_pokedex/core/services/services.dart';
import 'package:pocket_pokedex/core/services/snackbar_service.dart';

class SnackbarNotifier extends StatelessWidget {
  const SnackbarNotifier({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SnackbarMessage>>(
      stream: services.snackbarService.stream,
      builder: (context, snapshot) {
        final messages = snapshot.data;
        if (messages == null) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 12,
          children: messages
              .map(
                (message) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  reverseDuration: Duration.zero,
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: animation.drive(
                        Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset.zero,
                        ).chain(CurveTween(curve: Curves.easeInOut)),
                      ),
                      child: child,
                    );
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          message.message,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
