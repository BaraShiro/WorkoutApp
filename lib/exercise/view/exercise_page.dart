import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:workout/exercise/exercise.dart';
import 'package:workout/loading/loading.dart';
import 'package:workout/error/error.dart';
import 'package:workout_model/workout_model.dart';

class ExercisePage extends StatelessWidget {
  final UUID exerciseUuid;

  const ExercisePage({super.key, required this.exerciseUuid});

  static Route<void> route(UUID exerciseUuid) {
    return MaterialPageRoute<void>(builder: (_) => ExercisePage(exerciseUuid: exerciseUuid,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () => {},
            icon: const Icon(Symbols.edit_note),
            label: const Text("Edit"),
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
      body: Center(
          child: BlocProvider(
            create: (_) => ExerciseBloc(
                exerciseRepository: ExerciseRepository.instance
            )..add(ExerciseInitEvent(exerciseUuid: exerciseUuid)),
            child: BlocBuilder<ExerciseBloc, ExerciseState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, ExerciseState state) {
                  switch (state) {
                    case ExerciseInitial():
                      return const LoadingPage();
                    case ExerciseGetInProgress():
                      return const LoadingPage();
                    case ExerciseGetSuccess():
                      return ExerciseView(exercise: state.exercise);
                    case ExerciseGetFailure():
                      return  ErrorView(
                        error: state.error,
                        reloadFunction: () => {
                          context.read<ExerciseBloc>().add(ExerciseInitEvent(exerciseUuid: exerciseUuid))
                        },
                      );
                  }
                }
            ),
          )
      ),
    );
  }
}
