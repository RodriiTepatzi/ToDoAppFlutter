import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/providers/task_provider.dart';
import 'package:todo_flutter/static/widget_properties.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../other/dates.dart';

// ignore: must_be_immutable
class TaskCard extends StatefulWidget {
  final bool isLeft;
  final Task task;
  bool visible = true;
  TaskCard({Key? key, required this.isLeft, required this.task}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  var maxWidth = 200.0;

  @override
  Widget build(BuildContext context) {
    var size = (MediaQuery.of(context).size.width / 2) - 22.5;

    return GestureDetector(
      onTap: () => {

      },
      onLongPress: () => {
        
      },
      child: AnimationLimiter(
        child: AnimationConfiguration.synchronized(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: widget.visible ? 1.0 : 0.0,
            child: Container(
              height: size > maxWidth ? maxWidth : size,
              width: size > maxWidth ? maxWidth : size,
              margin: widget.isLeft ? const EdgeInsets.only(left: 15, right: 7.5, top: 15) : const EdgeInsets.only(left: 7.5, right: 15, top: 15),
              decoration: BoxDecoration(
                color: widget.task.colorTask,
                borderRadius: BorderRadius.circular(roundedCorners),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.task.emoji != null ? Container(
                    margin: const EdgeInsets.only(top: widgetMargin, left: widgetMargin),
                    child: Text(
                      widget.task.emoji != null ? widget.task.emoji! : "",
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                    )
                  ) : Container(),
                  Container(
                    margin: widget.task.emoji != null ? const EdgeInsets.only(top: widgetMargin, left: widgetMargin, right: widgetMargin) : const EdgeInsets.only(top: widgetMargin * 2, left: widgetMargin, right: widgetMargin),
                    child: Text(
                      widget.task.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(left: widgetMargin, top: widgetMargin),
                    child: Row(
                      children: [
                        Text(
                          Dates.calculateDateShort(widget.task.dateCreated),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Checkbox(
                          checkColor: Colors.black,
                          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.white;
                            }
                            return Colors.white;
                          }),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ), 
                          onChanged: (bool? value) async {
                            setState(() {
                              widget.visible = !widget.visible;
                              Future.delayed(const Duration(milliseconds: 101), () {
                                widget.task.isDone = value!;
                                //context.read<TaskProvider>().updateCard(widget.task);
                                Provider.of<TaskProvider>(context, listen: false).updateCard(widget.task);
                              });                          
                            });
                          }, 
                          value: widget.task.isDone
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}