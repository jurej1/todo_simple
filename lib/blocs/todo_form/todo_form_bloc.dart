import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/models.dart';

part 'todo_form_event.dart';
part 'todo_form_state.dart';

class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  TodoFormBloc()
      : super(
          TodoFormState(
            dueDate: TodoDueDateFormz.pure(DateTime.now().add(const Duration(days: 1))),
          ),
        ) {
    on<TodoFormDueDateUpdated>(_mapDueDateUpdatedToState);
    on<TodoFormTitleUpdated>(_mapTitleUpdatedToState);
    on<TodoFormPriorityUpdated>(_mapPriorityUpdatedToState);
    on<TodoFormIsComplitedUpdated>(_mapIsCompletedUpdatedToState);
    on<TodoFormSubmited>(_mapFormSubmitedToState);
  }

  void _mapDueDateUpdatedToState(TodoFormDueDateUpdated event, Emitter emit) {
    if (event.val != null) {
      final dueDate = TodoDueDateFormz.dirty(event.val!);

      emit(
        state.copyWith(
          dueDate: dueDate,
          status: Formz.validate([dueDate, state.isCompleted, state.priority, state.text]),
        ),
      );
    }
  }

  void _mapTitleUpdatedToState(TodoFormTitleUpdated event, Emitter emit) {
    final val = TodoTitleFormz.dirty(event.val);

    emit(
      state.copyWith(
        text: val,
        status: Formz.validate([val, state.dueDate, state.isCompleted, state.priority]),
      ),
    );
  }

  void _mapPriorityUpdatedToState(TodoFormPriorityUpdated event, Emitter emit) {
    final val = TodoPriorityFormz.dirty(event.val);

    emit(
      state.copyWith(
        priority: val,
        status: Formz.validate([val, state.dueDate, state.isCompleted, state.text]),
      ),
    );
  }

  void _mapIsCompletedUpdatedToState(TodoFormIsComplitedUpdated event, Emitter emit) {
    final val = TodoIsCompletedFormz.dirty(event.val);

    emit(
      state.copyWith(
        isCompleted: val,
        status: Formz.validate([val, state.dueDate, state.isCompleted, state.priority, state.text]),
      ),
    );
  }

  Future<void> _mapFormSubmitedToState(TodoFormSubmited event, Emitter<TodoFormState> emit) async {
    final isComplted = TodoIsCompletedFormz.dirty(state.isCompleted.value);
    final priority = TodoPriorityFormz.dirty(state.priority.value);
    final title = TodoTitleFormz.dirty(state.text.value);
    final dueDate = TodoDueDateFormz.dirty(state.dueDate.value);

    emit(
      state.copyWith(
        isCompleted: isComplted,
        dueDate: dueDate,
        priority: priority,
        text: title,
        status: Formz.validate([isComplted, priority, title, dueDate]),
      ),
    );

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
