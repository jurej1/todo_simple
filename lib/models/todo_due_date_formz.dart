import 'package:formz/formz.dart';

enum TodoDueDateValidationError { invalid }

class TodoDueDateFormz extends FormzInput<DateTime, TodoDueDateValidationError> {
  const TodoDueDateFormz.dirty(super.value) : super.dirty();
  const TodoDueDateFormz.pure(super.value) : super.pure();

  @override
  TodoDueDateValidationError? validator(DateTime value) {
    final now = DateTime.now();

    if (value.isBefore(now)) return TodoDueDateValidationError.invalid;

    return null;
  }
}
