import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:workout/add_session/add_session.dart';
import 'package:workout_model/workout_model.dart';

class AddSessionView extends StatelessWidget {
  const AddSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocListener<AddSessionBloc, AddSessionState>(
              listener: (context, state) {
            switch (state.status) {
              case SubmissionStatus.failure:
                {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        backgroundColor:
                            Theme.of(context).colorScheme.errorContainer,
                        content: Row(
                          children: [
                            Icon(
                              color: Theme.of(context).colorScheme.onSurface,
                              Symbols.error,
                            ),
                            const Padding(padding: EdgeInsets.all(12)),
                            Text(
                              'Failed to add workout session!',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer),
                            )
                          ],
                        ),
                      ),
                    );
                }
              case SubmissionStatus.success:
                {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        content: Row(
                          children: [
                            Icon(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              Symbols.check,
                            ),
                            const Padding(padding: EdgeInsets.all(12)),
                            Text(
                              'Workout session added.',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                            )
                          ],
                        ),
                      ),
                    );
                }
              default:
                {}
            }
          }, child: BlocBuilder<AddSessionBloc, AddSessionState>(
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.only(bottom: 200, top: 10),
                children: [
                  switch (state.selectedExercises.isEmpty) {
                    true => const Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("No exercises added 😱"),
                          Text("You can't workout without exercises!"),
                        ],
                      )),
                    false => ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.selectedExercises.length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return exerciseWidget(
                              state.selectedExercises[index], index, context);
                        }),
                  },
                  DropdownButtonHideUnderline(
                    child: Center(
                      child: DropdownButton(
                        hint: const Text("Select an exercise to add"),
                        disabledHint: const Text("No exercises found"),
                        items: state.allExercises
                            .map<DropdownMenuItem<Exercise>>((Exercise value) {
                          return DropdownMenuItem<Exercise>(
                              value: value, child: Text(value.name));
                        }).toList(),
                        onChanged: (exercise) => {
                          context
                              .read<AddSessionBloc>()
                              .add(AddExerciseToListEvent(exercise: exercise!))
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
        ),
      ),
      floatingActionButton: BlocBuilder<AddSessionBloc, AddSessionState>(
        buildWhen: (previous, current) =>
            previous.selectedExercises != current.selectedExercises,
        builder: (context, state) {
          if (state.selectedExercises.isNotEmpty) {
            return FloatingActionButton.extended(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              onPressed: () =>
                  {context.read<AddSessionBloc>().add(SubmitEvent())},
              label: const Text("Add workout"),
              icon: const Icon(Symbols.add),
            );
          } else {
            return FloatingActionButton.extended(
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
              onPressed: () => {},
              label: const Text("Add at least one exercise"),
              icon: const Icon(Symbols.error),
            );
          }
        },
      ),
    );
  }

  Widget exerciseWidget(Exercise exercise, int index, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: AddSessionExerciseCardWidget(exercise: exercise, index: index),
      ),
    );
  }
}
