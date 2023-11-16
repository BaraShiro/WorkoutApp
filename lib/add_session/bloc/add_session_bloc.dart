import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_session_event.dart';
part 'add_session_state.dart';

class AddSessionBloc extends Bloc<AddSessionEvent, AddSessionState> {
  AddSessionBloc() : super(AddSessionInitial()) {
    on<AddSessionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
