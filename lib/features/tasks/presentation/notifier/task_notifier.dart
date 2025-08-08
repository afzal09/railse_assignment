import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:railse_assignment/features/tasks/data/models/task_model.dart';
import 'package:railse_assignment/features/tasks/domain/entities/task_entity.dart';

class TaskManagerNotifier extends StateNotifier<List<TaskModel>> {
  TaskManagerNotifier() : super(_initialTasks);
  static final List<TaskModel> _initialTasks = [
    TaskModel(
      id: 'Order-1000',
      title: 'Order-1000',
      description: 'Go to Gym',
      user: 'Sandhya',
      priority: Priority.high,
      dueDate: DateTime.now().add(const Duration(days: 1)),
      startedDate: DateTime.now().subtract(const Duration(days: 2)),
      status: Status.notStarted,
    ),
    TaskModel(
      id: 'Order-1001',
      title: 'Order-1001',
      description: 'Take Dog for a walk',
      user: 'Ayan',
      priority: Priority.medium,
      dueDate: DateTime.now().add(const Duration(days: 5)),
      startedDate: DateTime.now().subtract(const Duration(days: 1)),
      status: Status.started,
    ),
    TaskModel(
      id: 'Order-1002',
      title: 'Order-1002',
      description: 'Send Money to Afzal',
      user: 'Sajid',
      priority: Priority.high,
      dueDate: DateTime.now().subtract(const Duration(hours: 17, minutes: 2)),
      startedDate: DateTime.now().subtract(const Duration(days: 3)),
      status: Status.overdue, // Example of overdue task based on previous UI
    ),
    TaskModel(
      id: 'Order-1003',
      title: 'Order-1003',
      description: 'Deliver goods to Ayan',
      user: 'Sandesh',
      priority: Priority.medium,
      dueDate: DateTime.now().subtract(const Duration(days: 1)),
      startedDate: DateTime.now().subtract(const Duration(days: 6)),
      status: Status.completed,
    ),
    TaskModel(
      id: 'Order-1004',
      title: 'Order-1004',
      description: 'Follow up on the job interview',
      user: 'Devansh',
      priority: Priority.low,
      dueDate: DateTime.now().add(const Duration(days: 2)),
      startedDate: DateTime.now().subtract(const Duration(days: 1)),
      status: Status.notStarted,
    ),
  ];
  void updateStatus(String taskId, Status newStatus) {
    state = [
      for (final task in state)
        if (task.id == taskId)
          task.updateModel(status: newStatus)
        else
          task,
    ];
  }

  void updateTaskDueDate(String taskId, DateTime newDate) {
    state = [
      for (final task in state)
        if (task.id == taskId)
          task.updateModel(dueDate: newDate)
        else
          task,
    ];
  }

  void updateTaskStartDate(String taskId, DateTime newDate) {
    state = [
      for (final task in state)
        if (task.id == taskId)
          task.updateModel(startedDate: newDate)
        else
          task,
    ];
  }
}
