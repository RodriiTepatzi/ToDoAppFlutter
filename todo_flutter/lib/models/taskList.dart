import 'package:todo_flutter/models/task.dart';

class TaskList{
  List<Task> tasks = [];

  toJSONEncodable() {
    return tasks.map((item) {
      return item.toJson();
    }).toList();
  }
}