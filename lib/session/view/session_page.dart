import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout/session/session.dart';
import 'package:workout/loading/loading.dart';
import 'package:workout/error/error.dart';
import 'package:workout_model/workout_model.dart';

class SessionPage extends StatelessWidget {
  final UUID sessionUuid;

  const SessionPage({super.key, required this.sessionUuid});

  static Route<void> route(UUID sessionUuid) {
    return MaterialPageRoute<void>(builder: (_) => SessionPage(sessionUuid: sessionUuid,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout session'),
      ),
      body: Center(
          child: BlocProvider(
            create: (_) => SessionBloc(
                workoutRepository: WorkoutRepository.instance
            )..add(SessionInitEvent(sessionUuid: sessionUuid)),
            child: BlocBuilder<SessionBloc, SessionState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, SessionState state) {
                  switch (state) {
                    case SessionInitial():
                      return const LoadingPage();
                    case SessionGetInProgress():
                      return const LoadingPage();
                    case SessionGetSuccess():
                      return SessionView(workout: state.workout);
                    case SessionGetFailure():
                      return  ErrorView(
                        error: state.error,
                        reloadFunction: () => {
                          context.read<SessionBloc>().add(SessionInitEvent(sessionUuid: sessionUuid))
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

