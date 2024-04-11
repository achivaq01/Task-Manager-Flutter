import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/classes/task.dart';
import 'package:untitled/widgets/editable_text_field.dart';

import '../classes/app_data.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final int index;
  const TaskTile({super.key, required this.task, required this.index});


  @override
  State<StatefulWidget> createState() => TaskTileStatus();
}

class TaskTileStatus extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    ThemeData theme = appData.theme;
    Task task = widget.task;
    Color tileColor = task.status ? theme.highlightColor : theme.cardColor;

    return Container(
      color: tileColor,
      child: InkWell(
        child: ListTile(
          title: Row(
            children: [
              Expanded(
                child: EditableTextField(appData: appData, index: widget.index),
              ),
              Checkbox(value: task.status, onChanged: (value) {
                appData.changeTaskStatus(widget.index);
              })
            ],
          ),
        ),
      ),
    );
  }

}