// ignore_for_file: no_leading_underscores_for_local_identifiers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:railse_assignment/features/tasks/domain/entities/task_entity.dart';
import 'package:railse_assignment/features/tasks/presentation/providers/task_provider.dart';
import 'package:railse_assignment/theme_values.dart';

class TaskTile extends ConsumerWidget {
  final TaskEntity task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskManager = ref.read(taskNotifier.notifier);

    Color sideBarColor = AppColors.greyColor;
    Color statusTextColor = AppColors.dueStatus;
    Widget statusWidget = Text(
      'Not Started',
      style: TextStyle(color: statusTextColor, fontWeight: FontWeight.bold),
    );
    Widget? actionButton = ElevatedButton(
      onPressed: () {
        taskManager.updateStatus(task.id, Status.started);
      },
      child: null,
    );
    bool isCompleted = false;
    bool isEditableDate = false;

    void _buildNotStarted() {
      sideBarColor = AppColors.greyColor;
      statusTextColor = AppColors.dueStatus;
      statusWidget = Text(
        'Not Started',
        style: TextStyle(color: statusTextColor, fontWeight: FontWeight.bold),
      );
      actionButton = ElevatedButton.icon(
        onPressed: () {
          taskManager.updateStatus(task.id, Status.started);
        },
        icon: const Icon(Icons.play_arrow, size: 16, color: AppColors.white),
        label: const Text(
          'Start Task',
          style: TextStyle(color: AppColors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.startStatus,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
      isEditableDate = true;
    }

    void _buildStarted() {
      sideBarColor = AppColors.overdueBar;
      statusTextColor = AppColors.overdueBar;
      statusWidget = Text(
        'Started',
        style: TextStyle(color: statusTextColor, fontWeight: FontWeight.bold),
      );
      actionButton = ElevatedButton.icon(
        onPressed: () {
          taskManager.updateStatus(task.id, Status.completed);
        },
        icon: const Icon(Icons.check, size: 16, color: AppColors.white),
        label: const Text(
          'Mark as Complete',
          style: TextStyle(color: AppColors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.completedStatus,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
      isEditableDate = true;
    }

    _buildCompleted() {
      isCompleted = true;
      sideBarColor = AppColors.completedStatus;
      statusTextColor = AppColors.completedStatus;
      statusWidget = Row(
        children: [
          Icon(Icons.check_circle, size: 16, color: statusTextColor),
          const SizedBox(width: 4),
          Text(
            'Completed',
            style: TextStyle(
              color: statusTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
      actionButton = null;
      isEditableDate = false;
    }

    void _buildOverdue() {
      sideBarColor = AppColors.overdueBar;
      statusTextColor = AppColors.overDueStatus;
      statusWidget = Text(
        'Overdue',
        style: TextStyle(color: statusTextColor, fontWeight: FontWeight.bold),
      );
      actionButton = TextButton(
        onPressed: () {
          taskManager.updateStatus(task.id, Status.completed);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(50, 30),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerRight,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check, size: 16, color: AppColors.completedStatus),
            const SizedBox(width: 4),
            Text(
              'Mark as Complete',
              style: TextStyle(color: AppColors.completedStatus, fontSize: 12),
            ),
          ],
        ),
      );
      isEditableDate = true;
    }

    switch (task.status) {
      case Status.notStarted:
        _buildNotStarted();
        break;
      case Status.started:
        _buildStarted();
        break;
      case Status.completed:
        _buildCompleted();
        break;
      case Status.overdue:
        _buildOverdue();
        break;
    }

    Future<void> _selectDate(BuildContext context, bool isDueDate) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: isDueDate ? task.dueDate : task.startedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.overdueBar,
                onPrimary: AppColors.white,
                onSurface: AppColors.darkGray,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.darkGray,
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        if (isDueDate) {
          taskManager.updateTaskDueDate(task.id, picked);
        } else {
          taskManager.updateTaskStartDate(task.id, picked);
        }
      }
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        decoration: BoxDecoration(
          color: isCompleted ? Colors.grey[300] : AppColors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border(left: BorderSide(color: sideBarColor, width: 6.0)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              task.id,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkGray,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_vert,
                                size: 20,
                                color: AppColors.greyColor,
                              ),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.greyColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          task.user,
                          style: const TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 13,
                          ),
                        ),
                        if (task.priority == Priority.high)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.veryHighPriority.withOpacity(
                                  0.1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'High Priority',
                                style: TextStyle(
                                  color: AppColors.veryHighPriority,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  statusWidget,
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: isEditableDate
                        ? () => _selectDate(context, true)
                        : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Due: ${DateFormat('MMM dd').format(task.dueDate)}',
                          style: TextStyle(
                            color: isEditableDate
                                ? AppColors.darkGray
                                : AppColors.greyColor,
                            fontSize: 12,
                          ),
                        ),
                        if (isEditableDate)
                          const Icon(
                            Icons.edit,
                            size: 14,
                            color: AppColors.greyColor,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: task.status == Status.notStarted
                        ? () => _selectDate(context, false)
                        : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Started: ${DateFormat('MMM dd').format(task.startedDate)}',
                          style: TextStyle(
                            color: (task.status == Status.notStarted)
                                ? AppColors.darkGray
                                : AppColors.greyColor,
                            fontSize: 12,
                          ),
                        ),
                        if (task.status == Status.notStarted)
                          const Icon(
                            Icons.edit,
                            size: 14,
                            color: AppColors.greyColor,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (actionButton != null) actionButton as Widget,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
