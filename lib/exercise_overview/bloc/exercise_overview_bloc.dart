import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'exercise_overview_event.dart';
part 'exercise_overview_state.dart';

class ExerciseOverviewBloc extends Bloc<ExerciseOverviewEvent, ExerciseOverviewState> {
  ExerciseOverviewBloc() : super(ExerciseOverviewInitial()) {
    on<ExerciseOverviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
