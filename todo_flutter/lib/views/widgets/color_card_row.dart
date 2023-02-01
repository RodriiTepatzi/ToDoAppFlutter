import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todo_flutter/providers/task_provider.dart';
import 'package:todo_flutter/static/colors.dart';
import 'package:todo_flutter/static/widget_properties.dart';

List<Widget> colorsRow(BuildContext context){
  List<Widget> widgets = [];

  for (var color in defaultColorsCard) {
    widgets.add(
      Container(
        margin: const EdgeInsets.only(left: widgetMargin),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: context.watch<TaskProvider>().newTaskColor == color ? color : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(50)
          ),
          padding: const EdgeInsets.all(3),
          child: RoundCheckBox(
            size: 35,
            borderColor: Colors.white,
            uncheckedColor: color,
            disabledColor: color,
            animationDuration: const Duration(milliseconds: 500),
            isChecked: color == context.watch<TaskProvider>().newTaskColor,
            checkedColor: color,
            onTap: (value) => context.read<TaskProvider>().setNewCardColor(color),
          ),
        ),
      )
    );
  }

  return widgets;
}