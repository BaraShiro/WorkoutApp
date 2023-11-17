import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout/add_session/add_session.dart';
import 'package:workout_model/workout_model.dart';

class AddSessionPage extends StatelessWidget {
  const AddSessionPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AddSessionPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add workout session'),
      ),
      body: Center(
          child: BlocProvider(
            create: (_) => AddSessionBloc(
                workoutRepository: WorkoutRepository.instance,
                exerciseRepository: ExerciseRepository.instance
            )..add(InitialEvent()),
            child: const AddSessionView(),
          )
      ),
    );
  }
}
