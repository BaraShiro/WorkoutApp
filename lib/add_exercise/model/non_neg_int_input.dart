import 'package:formz/formz.dart';

enum NonNegIntInputError { negative }

class NonNegIntInput extends FormzInput<int, NonNegIntInputError> {
  const NonNegIntInput.pure() : super.pure(0);

  const NonNegIntInput.dirty({int value = 0}) : super.dirty(value);

  @override
  NonNegIntInputError? validator(int value) {
    return switch (value) {
      < 0 => NonNegIntInputError.negative,
      _ => null
    };
  }
}