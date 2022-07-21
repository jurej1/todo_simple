import 'package:formz/formz.dart';
import 'package:todo_simple/models/models.dart';

enum TodoPriorityValidationError { invalid }

class TodoPriorityFormz extends FormzInput<Priority, TodoPriorityValidationError> {
  const TodoPriorityFormz.dirty([Priority val = Priority.moderate]) : super.dirty(val);
  const TodoPriorityFormz.pure([Priority val = Priority.moderate]) : super.pure(val);

  @override
  TodoPriorityValidationError? validator(Priority value) {
    return null;
  }
}
