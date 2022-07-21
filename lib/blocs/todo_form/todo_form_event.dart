part of 'todo_form_bloc.dart';

abstract class TodoFormEvent extends Equatable {
  const TodoFormEvent();

  @override
  List<Object?> get props => [];
}

class TodoFormTitleUpdated extends TodoFormEvent {
  final String val;

  const TodoFormTitleUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class TodoFormDueDateUpdated extends TodoFormEvent {
  final DateTime? val;

  const TodoFormDueDateUpdated(this.val);

  @override
  List<Object?> get props => [val];
}

class TodoFormPriorityUpdated extends TodoFormEvent {
  final Priority val;

  const TodoFormPriorityUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class TodoFormIsComplitedUpdated extends TodoFormEvent {
  final bool val;

  const TodoFormIsComplitedUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class TodoFormSubmited extends TodoFormEvent {}
