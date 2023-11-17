import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:workout/exercise_overview/exercise_overview.dart';
import 'package:workout/add_exercise/add_exercise.dart';
import 'package:workout_model/workout_model.dart';

class ExerciseOverviewView extends StatelessWidget {
  final List<Exercise> exercises;
  const ExerciseOverviewView({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: switch (exercises.isEmpty) {
          true => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No exercises found 😱"),
                  Text("You can't workout without exercises!"),
                ],
              )
          ),
          false => ListView.builder(
              padding: const EdgeInsets.only(bottom: 200, top: 10),
              itemCount: exercises.length,
              itemBuilder: (BuildContext context, int index,) {
                return exerciseWidget(exercises[index], context);
              }
          ),
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onPressed: () => Navigator.push(context, AddExercisePage.route())
            .whenComplete(
              () => context.read<ExerciseOverviewBloc>().add(GetAllExercisesEvent()),
        ),
        label: const Text("New exercise"),
        icon: const Icon(Symbols.add),
      ),
    );
  }

  Widget exerciseWidget(Exercise exercise, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ExerciseOverviewCardWidget(exercise: exercise),
      ),
    );
  }
}
