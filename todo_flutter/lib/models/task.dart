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

  Map<String, dynamic> toJson(){
    return {
      'emoji' : emoji,
      'title' : title,
      'dateReminder' : dateReminder,
      'dateCreated' : dateCreated,
      'description' : description,
      'isDone' : isDone,
      'red' : colorTask.red,
      'green' : colorTask.green,
      'blue' : colorTask.blue,
      'alpha' : colorTask.alpha,
    };
  }

  Task.fromJson(Map<String, dynamic> json) : this
    (
      title: json['title'],
      description: json['description'],
      isDone: json['isDone'],
      colorTask: Color.fromARGB(json['alpha'], json['red'], json['green'], json['blue']), 
      dateCreated: json['dateCreated'],
    );
}