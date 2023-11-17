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
      floatingActionButton: SessionControlWidget(workout: workout),
    );
  }

  Widget sessionDetailsWidget(Workout workout, BuildContext context) {
    return Center(
      child: Column(
        children: [
          SessionStatusWidget(workout: workout),
          const Padding(padding: EdgeInsets.all(12)),
        ],
      )
    );
  }

  Widget exerciseDetailWidget(Exercise exercise, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: ListTile(
          isThreeLine: true,
          titleAlignment: ListTileTitleAlignment.center,
          title: Text(exercise.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exercise.description),
              Text("${exercise.weightInKilograms} Kg"),
              Text("${exercise.numberOfSets} sets with ${exercise.numberOfRepetitions} reps, ${exercise.restTimeInMinutes} min rest time "),
            ],
          ),
        ),
      ),
    );
  }
}