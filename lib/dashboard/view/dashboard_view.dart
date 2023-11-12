import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout/dashboard/dashboard.dart';
import 'package:workout_model/workout_model.dart';

abstract class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
}

class DashboardWithContentView extends DashboardView {
  final String msg;
  final List<Workout> workouts;
  const DashboardWithContentView({super.key, required this.msg, required this.workouts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: workouts.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.only(bottom: 200),
                itemCount: workouts.length,
                itemBuilder: (BuildContext context, int index,) {
                  return workoutSessionWidget(workouts[index], context);
                }
            )
            : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No workout sessions found!'),
                    Text('Add a new session and start working out!')
                  ] ,
                )
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: () => {context.read<DashboardBloc>().add(AddSessionEvent(workout: Workout(exercises: [Exercise(name: "Exercise", description: "Something", numberOfRepetitions: 2, restTimeInMinutes: 1, numberOfSets: 2, weightInKilograms: 5)])))},
        label: const Text("New workout session"),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget workoutSessionWidget(Workout workout, BuildContext context) {
    String statusString = switch (workout.state) {
      WorkoutState.notStarted => "New session",
      WorkoutState.running => "Running session",
      WorkoutState.paused => "Paused session",
      WorkoutState.finished => "Finished session",
    };

    String startedOn = workout.startTime != null
        ? "Started on: ${workout.startTime}"
        : "Not started yet";

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Card(
          color: Theme.of(context).colorScheme.surfaceVariant,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: ListTile(
            isThreeLine: true,
            leading: Icon(Icons.directions_run),
            title: Text(statusString),
            subtitle: Text('Number of exercises: ${workout.exercises.length} \n$startedOn'),
            trailing: IconButton(
                    onPressed: () => Navigator.push(context, HomePage.route()),
                    icon: const Icon(Icons.find_in_page)
                ),
          ),
        ),
      ),
    );
  }
}

class DashboardWithErrorView extends DashboardView {
  final RepositoryError error;
  const DashboardWithErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.error,
              size: 48,
              ),
            Text(interpretErrorCode()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: () => {context.read<DashboardBloc>().add(GetAllSessionsEvent())},
        label: const Text("Reload"),
        icon: const Icon(Icons.refresh),
      ),

    );
  }

  String interpretErrorCode() {
    switch (error) {
      case RepositoryError.notFoundError:
        return "The element was not found in the database!";
      case RepositoryError.alreadyExistsError:
        return "The element already exists in the database!";
      case RepositoryError.databaseError:
        return "Could not read from or write to the database!";
      case RepositoryError.unknownError:
        return "An unknown error occurred!";
    }
  }

}

class DashboardLoadingView extends DashboardView {
  const DashboardLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator()
      ),
    );
  }
}