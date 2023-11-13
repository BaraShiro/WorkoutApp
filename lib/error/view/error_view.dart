import 'package:flutter/material.dart';
import 'package:workout_model/workout_model.dart';
import 'package:workout/error/error.dart';

class ErrorView extends StatelessWidget {
  final RepositoryError error;
  final void Function() reloadFunction;
  const ErrorView({super.key, required this.error, required this.reloadFunction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.error,
              size: 48,
            ),
            Text(interpretErrorCode(error)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: reloadFunction,
        label: const Text("Reload"),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}