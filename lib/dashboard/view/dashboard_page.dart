import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:workout/dashboard/dashboard.dart';
import 'package:workout/exercise_overview/exercise_overview.dart';
import 'package:workout/loading/loading.dart';
import 'package:workout/error/error.dart';
import 'package:workout_model/workout_model.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DashboardPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () =>
                Navigator.push(context, ExerciseOverviewPage.route()),
            icon: const Icon(Symbols.exercise),
            label: const Text("Exercises"),
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                foregroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        ],
      ),
      body: Center(
          child: BlocProvider(
        create: (_) => DashboardBloc(
          workoutRepository: WorkoutRepository.instance,
        )..add(GetAllSessionsEvent()),
        child: BlocBuilder<DashboardBloc, DashboardState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, DashboardState state) {
              switch (state) {
                case DashboardInitial():
                  return const LoadingPage();
                case DashboardInProgress():
                  return const LoadingPage();
                case DashboardSuccess():
                  return DashboardView(
                    workouts: state.workouts,
                  );
                case DashboardFailure():
                  return ErrorView(
                    error: state.error,
                    reloadFunction: () => {
                      context.read<DashboardBloc>().add(GetAllSessionsEvent())
                    },
                  );
              }
            }),
      )),
    );
  }
}
