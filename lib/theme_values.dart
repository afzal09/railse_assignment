import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // Main background color for the application frame
  static const Color lightGrayishBlue = Color(0xFFF0F3FF);
  static const Color blackColor = Color(0xFF212121);

  static const Color greyColor = Color(0xFF9E9E9E);
  static const Color lightGreyColor = Color(0xFFF5F5F5);

  // Background color for individual task cards
  static const Color white = Color(0xFFFFFFFF);

  // Dashed border color and some secondary text
  static const Color lightGrayBorder = Color(0xFFD9D9D9);

  // Accent bar color for overdue tasks
  static const Color overdueBar = Color(0xFF5C6BC0);

  // Main text color for titles and names
  static const Color darkGray = Color(0xFF212121);

  // Color for 'Overdue' status and 'High Priority' text
  static const Color overDueStatus = Color(0xFFE53935);

  // Color for 'Completed' status and checkmarks
  static const Color completedStatus = Color(0xFF4CAF50);

  // Color for 'Due' status
  static const Color dueStatus = Color(0xFFFFB300);

  // Color for 'Start Task' buttons and icons
  static const Color startStatus = Color(0xFF7E57C2);
  // Priority Colors (can be distinct or derived from the main palette)
  static const Color veryHighPriority = Color(0xFFFF0400);
  static const Color highPriorityColor = Color(0xFFE53935); // Strong Red
  static const Color mediumPriorityColor = Color(0xFFFFB300); // Vivid Orange
  static const Color lowPriorityColor = Color(0xFF43A047); // Bright Green
}
