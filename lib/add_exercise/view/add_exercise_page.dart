import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout/add_exercise/add_exercise.dart';
import 'package:workout_model/workout_model.dart';

class AddExercisePage extends StatelessWidget {

  const AddExercisePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AddExercisePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exercise'),
        // actions: <Widget>[
        //   TextButton.icon(
        //     onPressed: () => {},
        //     icon: const Icon(Icons.delete),
        //     label: const Text("Delete"),
        //     style: TextButton.styleFrom(
        //         foregroundColor: Theme.of(context).colorScheme.inversePrimary
        //     ),
        //   ),
        // ],
      ),

      body: Center(
          child: BlocProvider(
            create: (_) => AddExerciseBloc(
                exerciseRepository: ExerciseRepository.instance
            ),
            child: const AddExerciseView(),

          )
      ),
    );
  }
}

