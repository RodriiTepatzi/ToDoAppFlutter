import 'package:emoji_dialog_picker/emoji_dialog_picker.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/providers/lang_provider.dart';
import 'package:todo_flutter/providers/task_provider.dart';
import 'package:todo_flutter/static/colors.dart';
import 'package:todo_flutter/static/widget_properties.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/views/widgets/color_card_row.dart';

import '../models/task.dart';

class AddViewModal extends StatefulWidget {
  const AddViewModal({Key? key}) : super(key: key);

  @override
  State<AddViewModal> createState() => _AddViewModalState();
}

class _AddViewModalState extends State<AddViewModal> {
  String emoji = '☺️';
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.85,
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.85),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.watch<TaskProvider>().newTaskColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(roundedCorners), topRight: Radius.circular(roundedCorners)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context, "Closing modal.");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(widgetMargin * 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: shadowTransparent,
                            ),
                            height: 40,
                            width: 40,
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: shadowTransparent,
                        ),
                        child: EmojiButton(
                          emojiPickerView: EmojiPickerView(
                            hintText: context.watch<LangProvider>().get('emojiPickerHint'),
                            onEmojiSelected: (String emoji) {
                              setState(() {
                                this.emoji = emoji;
                              });
                            },
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              emoji,
                              style: const TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Theme(
                          data: ThemeData(
                            textSelectionTheme: TextSelectionThemeData(
                              selectionColor: Colors.white.withOpacity(.4),
                              selectionHandleColor: Colors.white.withOpacity(1),
                            ),
                          ),
                          child: TextField(
                            controller: _textFieldController,
                            cursorColor: Colors.white,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white
                              ),
                              hintText: "Task",
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: (MediaQuery.of(context).size.height * 0.3),
                ),
                Container(
                  margin: const EdgeInsets.only(top: widgetMargin),
                  padding: const EdgeInsets.all(widgetPadding),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.watch<LangProvider>().get('selectColor').toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          ...colorsRow(context),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<TaskProvider>().addNewTask(
                      Task(
                        title: _textFieldController.text, 
                        description: "testing", 
                        isDone: false,
                        colorTask: context.read<TaskProvider>().newTaskColor,
                        dateCreated: DateTime.now(),
                        emoji: emoji,
                      ),
                    );
                    
                    context.read<TaskProvider>().disposeCardColor();
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(9),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(roundedCorners),
                      color: const Color.fromARGB(255, 68, 171, 255)
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      context.watch<LangProvider>().get('addButton'),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],             
            ),
          ),
        ],
      ),
    );
  }
}