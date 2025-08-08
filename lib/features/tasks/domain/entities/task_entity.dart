enum Priority{low, medium, high, veryHigh}

class TaskEntity {
  final String user;
  final String title;
  final String description;
  final DateTime started;
  final DateTime dueDate;
  final Priority priority;
  final bool isCompleted;

  TaskEntity({
    required this.user,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.started,
    this.priority = Priority.medium,
    this.isCompleted = false,
  });
}