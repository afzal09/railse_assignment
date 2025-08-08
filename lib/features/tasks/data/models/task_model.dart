import 'package:railse_assignment/features/tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity{
  TaskModel({
    required super.id, 
    required super.user,
    required super.title,
    required super.description,
    required super.startedDate,
    required super.dueDate,
    super.priority,
    super.status,
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
      id: '',
      user: entity.user,
      title: entity.title,
      description: entity.description,
      startedDate: entity.startedDate,
      dueDate: entity.dueDate,
      priority: entity.priority,
      status: entity.status,
      isCompleted: entity.isCompleted,
    );
  }

  /// Convert model back to entity
  TaskEntity toEntity() {
    return TaskEntity(
      id: '',
      user: user,
      title: title,
      description: description,
      startedDate: startedDate,
      dueDate: dueDate,
      priority: priority,
      status: status,
      isCompleted: isCompleted,
    );
  }
  TaskModel updateModel({
    String? id,
    String? title,
    String? description,
    DateTime? startedDate,
    DateTime? dueDate,
    Priority? priority,
    Status? status,
    bool? isCompleted    
  }){
    return TaskModel(
      id: id ?? this.id,
      user: user,
      title: title ?? this.title,
      description: description ?? this.description,
      startedDate: startedDate ?? this.startedDate,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}