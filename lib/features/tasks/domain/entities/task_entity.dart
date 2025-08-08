enum Priority{low, medium, high, veryHigh}
enum Status{notStarted, started, completed}
class TaskEntity {
  final String user;
  final String title;
  final String description;
  final DateTime startedDate;
  final DateTime dueDate;
  final Priority priority;
  final Status status;
  final bool isCompleted;

  TaskEntity({
    required this.user,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.startedDate,
    this.status = Status.notStarted,
    this.priority = Priority.medium,
    this.isCompleted = false,
  });
}