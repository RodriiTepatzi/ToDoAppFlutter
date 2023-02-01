import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/models/taskList.dart';
import 'package:todo_flutter/providers/task_provider.dart';

class TaskService{
  final LocalStorage _taskLocalStorage = LocalStorage('todoAppLocalStorage.json');
  final TaskList _taskList = TaskList();
  BuildContext? context;

  // Singleton declaration
  TaskService._privateConstructor();
  static final TaskService _instance = TaskService._privateConstructor();
  static TaskService get instance => _instance;

  void setContext(BuildContext context){
    this.context = context;
  }

  List<Task> getTasks(){
    var tasks = <Task>[];

    _taskLocalStorage.getItem('tasks');

    return tasks;
  }

  getAllTasks() async {
    _taskList.tasks = await _taskLocalStorage.getItem('tasks') ?? [];
    context?.read<TaskProvider>().setLists(_taskList.tasks);
  }

  addTask(Task task) async {
    _taskList.tasks.add(task);
    
    _taskLocalStorage.setItem('tasks', _taskList.toJSONEncodable());
  }
}