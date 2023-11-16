import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:workout/add_exercise/add_exercise.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class AddExerciseView extends StatelessWidget {
  const AddExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocListener<AddExerciseBloc, AddExerciseState>(
            listener: (context, state) {
              switch (state.status) {
                case FormzSubmissionStatus.failure: {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                          backgroundColor: Theme.of(context).colorScheme.errorContainer,
                          content: Row(
                            children: [
                              Icon(
                                  color: Theme.of(context).colorScheme.onSurface,
                                  Symbols.error,
                              ),
                              const Padding(padding: EdgeInsets.all(12)),
                              Text(
                                'Failed to add exercise!',
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.onErrorContainer
                                ),
                              )
                            ],
                          ),
                      ),
                    );
                  }
                case FormzSubmissionStatus.success: {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        content: Row(
                          children: [
                            Icon(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                                Symbols.check,
                            ),
                            const Padding(padding: EdgeInsets.all(12)),
                            Text(
                              'Exercise added.',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                }
                default: {}
              }
            },
            child: LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Column(
                      children: [
                        _NameInput(),
                        _DescriptionInput(),
                        const Padding(padding: EdgeInsets.all(12)),
                        Row(
                          // Ugly workaround because SpinBox does not respect decoration icon padding
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Symbols.fitness_center),
                            const Padding(padding: EdgeInsets.all(5)),
                            Expanded(child: _SetsInput()),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(12)),
                        Row(
                          // Ugly workaround because SpinBox does not respect decoration icon padding
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Symbols.repeat),
                            const Padding(padding: EdgeInsets.all(5)),
                            Expanded(child: _RepsInput()),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(12)),
                        Row(
                          // Ugly workaround because SpinBox does not respect decoration icon padding
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Symbols.schedule),
                            const Padding(padding: EdgeInsets.all(5)),
                            Expanded(child: _RestInput()),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(12)),
                        Row(
                          // Ugly workaround because SpinBox does not respect decoration icon padding
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Symbols.weight),
                            const Padding(padding: EdgeInsets.all(5)),
                            Expanded(child: _WeightInput()),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<AddExerciseBloc, AddExerciseState>(
        buildWhen: (previous, current) => previous.isValid != current.isValid,
        builder: (context, state) {
          if(state.isValid) {
            return FloatingActionButton.extended(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              onPressed: () => {context.read<AddExerciseBloc>().add(AddExerciseSubmitEvent())},
              label: const Text("Add exercise"),
              icon: const Icon(Symbols.add),
            );
          } else {
            return FloatingActionButton.extended(
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
              onPressed: () => {},
              label: const Text("Fill out form to add exercise"),
              icon: const Icon(Symbols.error),
            );
          }

        },
      ),
      // floatingActionButton: context.read<AddExerciseBloc>().state.isValid
      //     ? FloatingActionButton.extended(
      //         backgroundColor: Theme.of(context).colorScheme.primary,
      //         foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      //         onPressed: () => {
      //           // context.read<AddExerciseBloc>().add(AddExerciseSubmitEvent(workout: Workout(exercises: [Exercise(name: "Exercise", description: "Something", numberOfRepetitions: 2, restTimeInMinutes: 1, numberOfSets: 2, weightInKilograms: 5)])))
      //         },
      //         label: Text(
      //             "Add exercise ${context.read<AddExerciseBloc>().state.isValid}"),
      //         icon: const Icon(Icons.add),
      //       )
      //     : null,
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddExerciseBloc, AddExerciseState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          // key: const Key('loginForm_usernameInput_textField'),
          onChanged: (name) => context
              .read<AddExerciseBloc>()
              .add(AddExerciseNameChangedEvent(name: name)),
          decoration: InputDecoration(
            labelText: 'Exercise name',
            hintText: "Mandatory, can't be empty",
            icon: const Icon(Symbols.title),
            errorText: state.name.displayError != null ? 'invalid name' : null,
          ),
        );
      },
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddExerciseBloc, AddExerciseState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return TextField(
          // key: const Key('loginForm_usernameInput_textField'),
          onChanged: (description) => context.read<AddExerciseBloc>().add(
              AddExerciseDescriptionChangedEvent(description: description)),
          decoration: InputDecoration(
            labelText: 'Exercise description',
            hintText: 'Optional, can be left empty',
            icon: const Icon(Symbols.notes),
            errorText: state.description.displayError != null
                ? 'invalid description'
                : null,
          ),
        );
      },
    );
  }
}

class _RepsInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddExerciseBloc, AddExerciseState>(
      buildWhen: (previous, current) => previous.reps != current.reps,
      builder: (context, state) {
        return SpinBox(
          min: 1,
          max: 100,
          value: 1,
          readOnly: true,
          onChanged: (reps) => context
              .read<AddExerciseBloc>()
              .add(AddExerciseRepsChangedEvent(reps: reps.round())),
          decoration: InputDecoration(
            labelText: 'Number of repetitions',
            errorText: state.reps.displayError != null
                ? 'Must be a positive integer'
                : null,
          ),
        );
      },
    );
  }
}

class _RestInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddExerciseBloc, AddExerciseState>(
      buildWhen: (previous, current) => previous.rest != current.rest,
      builder: (context, state) {
        return SpinBox(
          min: 0,
          max: 100,
          value: 5,
          readOnly: true,
          onChanged: (rest) => context
              .read<AddExerciseBloc>()
              .add(AddExerciseRestChangedEvent(rest: rest.round())),
          decoration: InputDecoration(
            labelText: 'Minutes of rest time',
            errorText: state.rest.displayError != null
                ? 'Must be a non negative integer'
                : null,
          ),
        );
      },
    );
  }
}

class _SetsInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddExerciseBloc, AddExerciseState>(
      buildWhen: (previous, current) => previous.sets != current.sets,
      builder: (context, state) {
        return SpinBox(
          min: 1,
          max: 100,
          value: 1,
          readOnly: true,
          onChanged: (sets) => context
              .read<AddExerciseBloc>()
              .add(AddExerciseSetsChangedEvent(sets: sets.round())),
          decoration: InputDecoration(
            labelText: 'Number of sets',
            // icon: const Icon(Symbols.repeat),
            errorText: state.sets.displayError != null
                ? 'Must be a positive integer'
                : null,
          ),
        );
      },
    );
  }
}

class _WeightInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddExerciseBloc, AddExerciseState>(
      buildWhen: (previous, current) => previous.weight != current.weight,
      builder: (context, state) {
        return SpinBox(
          min: 0,
          max: 200,
          value: 10.0,
          decimals: 1,
          step: 0.1,
          acceleration: 0.2,
          readOnly: true,
          onChanged: (weight) => context
              .read<AddExerciseBloc>()
              .add(AddExerciseWeightChangedEvent(weight: weight)),
          decoration: InputDecoration(
            labelText: 'Weight in kilograms',
            errorText: state.weight.displayError != null
                ? 'Must be a non negative number'
                : null,
          ),
        );
      },
    );
  }
}
