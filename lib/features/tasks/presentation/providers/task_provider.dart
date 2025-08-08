import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:railse_assignment/features/tasks/domain/entities/task_entity.dart';
import 'package:railse_assignment/features/tasks/presentation/notifier/task_notifier.dart';


final taskNotifier = StateNotifierProvider<TaskManagerNotifier,TaskEntity>((ref){return TaskManagerNotifier();});
