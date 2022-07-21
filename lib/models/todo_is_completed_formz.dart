import 'package:formz/formz.dart';

enum TodoIsCompletedValidationError { invalid }

class TodoIsCompletedFormz extends FormzInput<bool, TodoIsCompletedValidationError> {
  const TodoIsCompletedFormz.dirty([bool val = false]) : super.dirty(val);
  const TodoIsCompletedFormz.pure([bool val = false]) : super.pure(val);

  @override
  TodoIsCompletedValidationError? validator(bool value) {
    return null;
  }
}
