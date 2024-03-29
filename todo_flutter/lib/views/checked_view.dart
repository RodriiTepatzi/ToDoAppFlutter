import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/controllers/dashboard_controller.dart';
import 'package:todo_flutter/providers/lang_provider.dart';
import 'package:todo_flutter/providers/task_provider.dart';
import 'package:todo_flutter/static/colors.dart';
import 'package:todo_flutter/static/widget_properties.dart';
import 'package:todo_flutter/views/add_view_modal.dart';

class CheckedView extends StatefulWidget {
  const CheckedView({Key? key}) : super(key: key);

  @override
  State<CheckedView> createState() => _CheckedViewState();
}

class _CheckedViewState extends State<CheckedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgApp,
        elevation: 0.0,
        title: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.only(bottom: 15.0),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(255, 234, 234, 234),
                  width: 2.0,
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  context.watch<LangProvider>().get('titleCheckedView'),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      enableDrag: true,
                      isScrollControlled: true,
                      elevation: 0.85,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(roundedCorners),
                          topRight: Radius.circular(roundedCorners)
                        ),
                      ),
                      builder: (BuildContext context) {
                        return const AddViewModal();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, value, child){
          return ListView(
            children: [
              ...DashboardController().generateCardsChecked(context.watch<TaskProvider>().checkedTasks!),
              context.watch<TaskProvider>().checkedTasks!.isEmpty ? Container(
                margin: const EdgeInsets.only(top: widgetMargin),
                child: Text(
                  context.watch<LangProvider>().get("noItems"),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ) : Container(),
            ],
          );
        }
      ),
    );
  }
}