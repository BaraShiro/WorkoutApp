import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout/dashboard/dashboard.dart';
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
            onPressed: () => {},
            icon: const Icon(Icons.fitness_center),
            label: const Text("Exercises"),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.inversePrimary
            ),
          ),
        ],
      ),

      body: Center(
        child: BlocProvider(
          create: (_) => DashboardBloc(
              workoutRepository: WorkoutRepository.instance,
              exerciseRepository: ExerciseRepository.instance
          )..add(GetAllSessionsEvent()),
          child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, DashboardState state) {
                switch (state) {
                  case DashboardInitial():
                    return DashboardWithContentView(msg: 'Initial', workouts: [],);
                  case DashboardInProgress():
                    return DashboardLoadingView();
                  case DashboardSuccess():
                    return DashboardWithContentView(msg: 'Success!', workouts: state.workouts,);
                  case DashboardFailure():
                    return DashboardWithErrorView(error: state.error);
                }
              }
          ),

        )
      ),
    );
  }
}

