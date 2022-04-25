import 'package:flutter/material.dart';

class Task{
  String title;
  String description;
  bool isDone;
  Color colorTask;

  Task(
    {
      required this.title,
      required this.description,
      required this.isDone,
      required this.colorTask,
    }
  );
}