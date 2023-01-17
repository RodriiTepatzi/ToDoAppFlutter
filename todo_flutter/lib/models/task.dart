import 'package:flutter/material.dart';

class Task{
  String? emoji;
  DateTime? dateReminder;
  String title;
  DateTime dateCreated;
  String description;
  bool isDone;
  Color colorTask;

  Task(
    {
      required this.title,
      required this.description,
      required this.isDone,
      required this.colorTask,
      required this.dateCreated,
      this.emoji,
      this.dateReminder,
    }
  );
}