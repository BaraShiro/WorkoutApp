import 'package:formz/formz.dart';

enum DescriptionInputError { bad }

class DescriptionInput extends FormzInput<String, DescriptionInputError> {
  const DescriptionInput.pure() : super.pure('');

  const DescriptionInput.dirty({String value = ''}) : super.dirty(value);

  @override
  DescriptionInputError? validator(String value) {
    return null;
  }
}