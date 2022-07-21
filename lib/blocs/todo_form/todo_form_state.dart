part of 'todo_form_bloc.dart';

class TodoFormState extends Equatable {
  const TodoFormState({
    this.priority = const TodoPriorityFormz.pure(),
    this.text = const TodoTitleFormz.pure(),
    required this.dueDate,
    this.isCompleted = const TodoIsCompletedFormz.pure(),
    this.status = FormzStatus.pure,
  });

  final TodoPriorityFormz priority;
  final TodoTitleFormz text;
  final TodoDueDateFormz dueDate;
  final TodoIsCompletedFormz isCompleted;
  final FormzStatus status;

  @override
  List<Object> get props {
    return [
      priority,
      text,
      dueDate,
      isCompleted,
      status,
    ];
  }

  TodoFormState copyWith({
    TodoPriorityFormz? priority,
    TodoTitleFormz? text,
    TodoDueDateFormz? dueDate,
    TodoIsCompletedFormz? isCompleted,
    FormzStatus? status,
  }) {
    return TodoFormState(
      priority: priority ?? this.priority,
      text: text ?? this.text,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
      status: status ?? this.status,
    );
  }
}
