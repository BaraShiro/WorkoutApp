import 'package:flutter/material.dart';
import 'package:workout/session/session.dart';
import 'package:workout_model/workout_model.dart';

class SessionView extends StatelessWidget {
  final Workout workout;

  const SessionView({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            sessionDetailsWidget(workout, context),
            switch (workout.exercises.isEmpty) {
              true => const  Column(
                children: [
                  Text("No exercises found 😱"),
                  Text("You can't workout without exercises!"),
                ],
              ),
              false => ListView.builder(
                shrinkWrap: true,
                  itemCount: workout.exercises.length,
                  itemBuilder: (BuildContext context, int index) {
                    return exerciseDetailWidget(workout.exercises[index], context);
                  }
              ),
            }
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   onPressed: () => {context.read<DashboardBloc>().add(AddSessionEvent(workout: Workout(exercises: [Exercise(name: "Exercise", description: "Something", numberOfRepetitions: 2, restTimeInMinutes: 1, numberOfSets: 2, weightInKilograms: 5)])))},
      //   label: const Text("New workout session"),
      //   icon: const Icon(Icons.add),
      // ),
    );
  }

  Widget sessionDetailsWidget(Workout workout, BuildContext context) {
    return Center(
      child: Column(
        children: [
          SessionStatusWidget(workout: workout),
          SessionControlWidget(workout: workout),
        ],
      )
    );
  }

  Widget exerciseDetailWidget(Exercise exercise, BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(exercise.name),
          Text(exercise.description),
          Text("${exercise.weightInKilograms} Kg"),
          Text("${exercise.numberOfSets} sets with ${exercise.numberOfRepetitions} reps, ${exercise.restTimeInMinutes} min rest time "),
        ],
      ),
    );
  }

}