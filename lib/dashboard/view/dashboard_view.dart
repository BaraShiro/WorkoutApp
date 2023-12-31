import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:workout/dashboard/dashboard.dart';
import 'package:workout/add_session/add_session.dart';
import 'package:workout_model/workout_model.dart';

class DashboardView extends StatelessWidget {
  final List<Workout> workouts;

  const DashboardView({super.key, required this.workouts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: switch (workouts.isEmpty) {
          true => const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No workout sessions found!'),
                Text('Add a new session and start working out!')
              ],
            )),
          false => ListView.builder(
              padding: const EdgeInsets.only(bottom: 200, top: 10),
              itemCount: workouts.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return workoutSessionWidget(workouts[index], context);
              }),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onPressed: () =>
            Navigator.push(context, AddSessionPage.route()).whenComplete(
          () => context.read<DashboardBloc>().add(GetAllSessionsEvent()),
        ),
        label: const Text("New workout session"),
        icon: const Icon(Symbols.add),
      ),
    );
  }

  Widget workoutSessionWidget(Workout workout, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: DashboardCardWidget(
          workout: workout,
        ),
      ),
    );
  }
}
