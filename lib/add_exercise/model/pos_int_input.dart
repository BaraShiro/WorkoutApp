import 'package:formz/formz.dart';

enum PosIntInputError { negative, zero }

class PosIntInput extends FormzInput<int, PosIntInputError> {
  const PosIntInput.pure() : super.pure(1);

  const PosIntInput.dirty({int value = 1}) : super.dirty(value);

  @override
  PosIntInputError? validator(int value) {
    return switch (value) {
      < 0 => PosIntInputError.negative,
      == 0 => PosIntInputError.zero,
      _ => null
    };
  }
}