import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';

class DashboardController{

  List<Task> getTasks(){
    List<Task> data = [];

    data.add(Task(title: "Jugar lol", description: "Lolcito", isDone: false, colorTask: Colors.green));
    data.add(Task(title: "Jugar valorant", description: "Peor juego del mundo", isDone: false, colorTask: Colors.red));
    data.add(Task(title: "Jugar valorant", description: "Peor juego del mundo", isDone: false, colorTask: Colors.purple));

    return data;
  }

  List<Widget> generateCards(){
    List<Task> tasks = getTasks();
    List<Widget> widgets = [];


    for (var i = 0; i < tasks.length; i++) {
      if((i+1) % 2 == 0){
        
        
      }
      else{
        
      }
    }

    return widgets;
  }

}