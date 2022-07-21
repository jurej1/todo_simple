import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum Priority { low, moderate, high }

extension PriorityX on Priority {
  valToString() {
    if (this == Priority.low) {
      return 'Low';
    } else if (this == Priority.moderate) {
      return 'Moderate';
    } else {
      return 'High';
    }
  }
}

class Todo extends Equatable {
  final String id;
  final String text;
  final Priority priority;
  final DateTime? dueDate;
  final bool done;
  final Color color;
  final DateTime created;

  const Todo({
    this.id = '',
    required this.text,
    required this.priority,
    this.dueDate,
    this.done = false,
    required this.color,
    required this.created,
  });

  @override
  List<Object?> get props {
    return [
      id,
      text,
      priority,
      dueDate,
      done,
      color,
      created,
    ];
  }

  Todo copyWith({
    String? id,
    String? text,
    Priority? priority,
    DateTime? dueDate,
    bool? done,
    Color? color,
    DateTime? created,
  }) {
    return Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      done: done ?? this.done,
      color: color ?? this.color,
      created: created ?? this.created,
    );
  }
}
