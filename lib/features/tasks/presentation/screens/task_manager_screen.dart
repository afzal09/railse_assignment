// ignore_for_file: subtype_of_sealed_class

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:railse_assignment/features/tasks/domain/entities/task_entity.dart';
import 'package:railse_assignment/features/tasks/presentation/providers/task_provider.dart';
import 'package:railse_assignment/features/tasks/presentation/screens/common/tasktile.dart';
import 'package:railse_assignment/theme_values.dart';


class TaskManagerScreen extends ConsumerWidget {
  const TaskManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<TaskEntity> tasks = ref.watch(taskNotifier);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.task_alt, color: AppColors.darkGray, size: 30),
        title: const Text(
          'TaskManager UI',
          style: TextStyle(color: AppColors.darkGray),
        ),
        backgroundColor: AppColors.white,
        elevation: 1,
      ),
      body: Container(
        color: AppColors.lightGrayishBlue,
        child: ListView.builder(
          itemCount: tasks.length, 
          itemBuilder: (context, index) {
            return TaskTile(task: tasks[index]);
          },
        ),
      ),
    );
  }
}
