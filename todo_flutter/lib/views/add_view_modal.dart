import 'package:emoji_dialog_picker/emoji_dialog_picker.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/providers/lang_provider.dart';
import 'package:todo_flutter/static/widget_properties.dart';
import 'package:provider/provider.dart';

class AddViewModal extends StatefulWidget {
  const AddViewModal({Key? key}) : super(key: key);

  @override
  State<AddViewModal> createState() => _AddViewModalState();
}

class _AddViewModalState extends State<AddViewModal> {
  Color colorCard = Color.fromARGB(255, 237, 132, 255);
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
                    color: colorCard,
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
                              color: Color.fromARGB(169, 245, 245, 245),
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
                          color: Color.fromARGB(168, 245, 245, 245),
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
                        child: TextField(
                          controller: _textFieldController,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.white
                            ),
                            hintText: "Task",
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: (MediaQuery.of(context).size.height * 0.3),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true, 
                      onChanged: (value) {
                        
                      },
                    )
                  ],
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(9),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(roundedCorners),
                      color: const Color.fromARGB(255, 104, 179, 240)
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