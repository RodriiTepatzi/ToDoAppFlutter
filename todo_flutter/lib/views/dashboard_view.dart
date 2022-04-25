import 'package:flutter/material.dart';
import 'package:todo_flutter/static/colors.dart';
import 'package:todo_flutter/views/widgets/task_card.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgApp,
        elevation: 0.0,
        title: Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            "Tasks",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            children: [
              TaskCard(isLeft: true,),
              TaskCard(isLeft: false,),
            ],
          ),
        ],
      ),
    );
  }
}