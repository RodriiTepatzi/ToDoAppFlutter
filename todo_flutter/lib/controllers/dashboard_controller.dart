import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/views/widgets/task_card.dart';

class DashboardController{

  List<Task> getTasks(){
    List<Task> data = [];

    data.add(Task(title: "Mandar los pendientes de la clase idkaaa", description: "Lolcito", isDone: false, colorTask: Colors.green, dateCreated: DateTime(2023,1,16), emoji: '🎮'));
    data.add(Task(title: "Jugar valorantxd", description: "Peor juego del mundo", isDone: false, colorTask: Colors.red, dateCreated: DateTime(2023,1,10)));
    data.add(Task(title: "Jugar valorant", description: "Peor juego del mundo", isDone: false, colorTask: Colors.purple, dateCreated: DateTime(2023,1,1)));

    return data;
  }

  List<Widget> generateCards(List<Task> task){
    List<Widget> widgets = [];
    List<Widget> tempWidgets = [];

    var tasks = task.where((element) => element.isDone == false).toList();

    for (var i = 0; i < tasks.length; i++){
      if((i + 1) % 2 == 0){
        tempWidgets.add(TaskCard(isLeft: false, task: tasks[i]));
        widgets.add(Row(children: [...tempWidgets],));
        tempWidgets = [];
      }
      else{
        if(i+1 == tasks.length) {
          widgets.add(Row(children: [TaskCard(isLeft: true, task: tasks[i])]));
        } else {
          tempWidgets.add(TaskCard(isLeft: true, task: tasks[i]));
        }
      }
    }

    return widgets;
  }

  List<Widget> generateCardsChecked(List<Task> task){
    List<Widget> widgets = [];
    List<Widget> tempWidgets = [];
    var tasks = task.where((element) => element.isDone == true).toList();

    for (var i = 0; i < tasks.length; i++){
      if((i + 1) % 2 == 0){
        tempWidgets.add(TaskCard(isLeft: false, task: tasks[i]));
        widgets.add(Row(children: [...tempWidgets],));
        tempWidgets = [];
      }
      else{
        if(i+1 == tasks.length) {
          widgets.add(Row(children: [TaskCard(isLeft: true, task: tasks[i])]));
        } else {
          tempWidgets.add(TaskCard(isLeft: true, task: tasks[i]));
        }
      }
    }

    return widgets;
  }

}