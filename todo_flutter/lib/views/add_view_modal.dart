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
  Color colorCard = Colors.purple;
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
                              color: const Color.fromARGB(149, 240, 240, 240),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: const Color.fromARGB(149, 240, 240, 240),
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
                    ]
                  ),
                  height: (MediaQuery.of(context).size.height * 0.3),
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
                      context.read<LangProvider>().get('addButton'),
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