import 'package:formz/formz.dart';

enum NonNegNumInputError { negative }

class NonNegNumInput extends FormzInput<double, NonNegNumInputError> {
  const NonNegNumInput.pure() : super.pure(0);

  const NonNegNumInput.dirty({double value = 0}) : super.dirty(value);

  @override
  NonNegNumInputError? validator(double value) {
    return switch (value) {
      < 0.0 => NonNegNumInputError.negative,
      _ => null
    };
  }
}