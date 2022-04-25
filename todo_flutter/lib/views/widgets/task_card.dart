import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';

class TaskCard extends StatefulWidget {
  final bool isLeft;
  final Task task;
  const TaskCard({Key? key, required this.isLeft, required this.task}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: (MediaQuery.of(context).size.width / 2) - 22.5,
      width: (MediaQuery.of(context).size.width / 2) - 22.5,
      margin: widget.isLeft ? const EdgeInsets.only(left: 15, right: 7.5) : const EdgeInsets.only(left: 7.5, right: 15),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}