import 'package:flutter/material.dart';
import 'package:railse_assignment/features/tasks/data/models/task_model.dart';
import 'package:railse_assignment/features/tasks/domain/entities/task_entity.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  // final List<TaskModel> tasks = [TaskModel(
  //   user: 'user',
  //   title: 'title',
  //   description: 'description',
  //   started: DateTime.now(),
  //   dueDate: DateTime.now().add(const Duration(days: 1)))];
  final TaskModel task = TaskModel(
    user: 'afzal',
    title: 'title',
    description: 'description',
    startedDate: DateTime.now(),
    dueDate: DateTime.now().add(const Duration(days: 1)),
    priority: Priority.low,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [_buildTaskTile(task)]));
  }

  Widget _buildTaskTile(TaskModel task) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border(
          left: BorderSide(
            color: Colors.red, 
            width: 6.0, 
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, 
              mainAxisAlignment:
                  MainAxisAlignment.center, 
              children: [
                Text(task.title),
                Text(task.description),
                const SizedBox(
                  height: 8,
                ), 
                Row(
                  children: [
                    Text(
                      '${task.user}',
                    ), 
                    Text('  ${task.priority.toString()}'),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .end,
              mainAxisAlignment:
                  MainAxisAlignment.center, 
              children: [
                Text('OverDue - ${task.dueDate.toString()}'),
                Text(task.startedDate.toString()),
                const SizedBox(height: 8), 
                Text('Mark as Complete'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildTaskTileList(List<TaskModel> tasks) {}
}
