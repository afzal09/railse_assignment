import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:railse_assignment/features/tasks/data/models/task_model.dart';
import 'package:railse_assignment/features/tasks/domain/entities/task_entity.dart';

class TaskManagerNotifier extends StateNotifier<TaskModel> {
  TaskManagerNotifier()
    : super(
        TaskModel(
          user: 'guest',
          title: 'example title',
          description: 'example description',
          startedDate: DateTime.now(),
          dueDate: DateTime.now().add(const Duration(days: 1)),
        ),
      );

  void updateTitle(String newTitle) {
    state = state.updateModel(title: newTitle);
  }

  void updateDescription(String newDescription) {
    state = state.updateModel(description: newDescription);
  }

  void updateStartedDate(DateTime newStartedDate) {
    state = state.updateModel(startedDate: newStartedDate);
  }

  void updateDueDate(DateTime newDueDate) {
    state = state.updateModel(dueDate: newDueDate);
  }

  void updatePriority(Priority priority) {
    state = state.updateModel(priority: priority);
  }

  void updateStatus(Status status) {
    state = state.updateModel(status: status);
  }

  void updateIsCompleted(bool status) {
    state = state.updateModel(isCompleted: status);
  }
}