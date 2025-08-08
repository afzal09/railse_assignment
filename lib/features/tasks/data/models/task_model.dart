import 'package:railse_assignment/features/tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity{
  TaskModel({
    required super.user,
    required super.title,
    required super.description,
    required super.started, 
    required super.dueDate,
    super.priority,
    super.isCompleted, 
  });
    Map<String, dynamic> toMap() {
    return {
      'user': user,
      'title': title,
      'description': description,
      'dueDate': DateTime.timestamp(),
      'priority': priority.name,
      'isCompleted': isCompleted,
    };
  }
    factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      user: entity.user,
      title: entity.title,
      description: entity.description,
      started: entity.started,
      dueDate: entity.dueDate,
      priority: entity.priority,
      isCompleted: entity.isCompleted,
    );
  }

  /// Convert model back to entity
  TaskEntity toEntity() {
    return TaskEntity(
      user: user,
      title: title,
      description: description,
      started: started,
      dueDate: dueDate,
      priority: priority,
      isCompleted: isCompleted,
    );
  }
}