import 'package:formz/formz.dart';

enum TodoTitleFormzValidationError { invalid }

class TodoTitleFormz extends FormzInput<String, TodoTitleFormzValidationError> {
  const TodoTitleFormz.dirty([String val = '']) : super.dirty(val);
  const TodoTitleFormz.pure([String val = '']) : super.pure(val);

  @override
  TodoTitleFormzValidationError? validator(String value) {
    return null;
  }
}
