import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout/exercise_overview/exercise_overview.dart';
import 'package:workout/loading/loading.dart';
import 'package:workout/error/error.dart';
import 'package:workout_model/workout_model.dart';

class ExerciseOverviewPage extends StatelessWidget {
  const ExerciseOverviewPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ExerciseOverviewPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
      ),
      body: Center(
          child: BlocProvider(
            create: (_) => ExerciseOverviewBloc(
              exerciseRepository: ExerciseRepository.instance,
            )..add(GetAllExercisesEvent()),
            child: BlocBuilder<ExerciseOverviewBloc, ExerciseOverviewState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, ExerciseOverviewState state) {
                  switch (state) {
                    case ExerciseOverviewInitial():
                      return const LoadingPage();
                    case ExerciseOverviewGetInProgress():
                      return const LoadingPage();
                    case ExerciseOverviewGetSuccess():
                      return ExerciseOverviewView(exercises: state.exercises,);
                    case ExerciseOverviewGetFailure():
                      return ErrorView(
                        error: state.error,
                        reloadFunction: () => {
                          context.read<ExerciseOverviewBloc>().add(GetAllExercisesEvent())
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

