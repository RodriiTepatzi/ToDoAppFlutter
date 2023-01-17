import 'package:flutter/material.dart';
import 'package:todo_flutter/static/widget_properties.dart';

class AddViewModal extends StatefulWidget {
  const AddViewModal({Key? key}) : super(key: key);

  @override
  State<AddViewModal> createState() => _AddViewModalState();
}

class _AddViewModalState extends State<AddViewModal> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.85,
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.85),
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text("data"),
                      )
                    ],
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