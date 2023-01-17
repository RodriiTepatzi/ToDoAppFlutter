import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/controllers/dashboard_controller.dart';
import 'package:todo_flutter/providers/task_provider.dart';
import 'package:todo_flutter/static/colors.dart';
import 'package:todo_flutter/static/widget_properties.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

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
          Column(
            children: [
              ...DashboardController().generateCards(context.watch<TaskProvider>().uncheckedTasks!),
              context.watch<TaskProvider>().uncheckedTasks!.isEmpty ? Container(
                margin: const EdgeInsets.only(top: widgetMargin),
                child: const Text(
                  "No hay elementos.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ) : Container(),
            ],
          ),
        ],
      ),
    );
  }
}