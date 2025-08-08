enum Priority{low, medium, high, veryHigh}
enum Status{notStarted, started, completed,overdue}
class TaskEntity {
  final String id;
  String user;
  final String title;
  final String description;
  DateTime startedDate;
  DateTime dueDate;
  Priority priority;
  Status status;
  bool isCompleted;

  TaskEntity({
    required this.id,
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