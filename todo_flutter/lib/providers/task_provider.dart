import 'package:flutter/material.dart';
import 'package:todo_flutter/controllers/dashboard_controller.dart';
import 'package:todo_flutter/models/task.dart';

class TaskProvider with ChangeNotifier{
  List<Task>? checkedTasks;
  List<Task>? uncheckedTasks;
  Color newTaskColor = Colors.purple;

  TaskProvider(){
    uncheckedTasks = DashboardController().getTasks();
    checkedTasks = [];

    sortLists();
  }

  void updateCard(Task task){
    if(task.isDone){
      uncheckedTasks?.removeWhere((element) => element.title == task.title);
      checkedTasks?.add(task);
    }
    else{
      checkedTasks?.removeWhere((element) => element.title == task.title);
      uncheckedTasks?.add(task);
    }

    sortLists();
    notifyListeners();
  }

  void sortLists(){
    checkedTasks?.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
    uncheckedTasks?.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
  }

  void addNewTask(Task task){
    uncheckedTasks?.add(task);
    notifyListeners();
  }

  void setNewCardColor(Color color){ 
    newTaskColor = color;
    notifyListeners();
  }
  void disposeCardColor() => newTaskColor = Colors.purple;
}