import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/classes/task.dart';
import 'package:untitled/widgets/editable_text_field.dart';

import '../classes/app_data.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final int index;
  const TaskTile({Key? key, required this.task, required this.index}) : super(key: key);

  @override
  State<TaskTile> createState() => TaskTileStatus();
}

class TaskTileStatus extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    ThemeData theme = appData.theme;
    Task task = widget.task;
    Color tileColor = task.status ? Colors.deepPurple : theme.splashColor;

    return ReorderableDragStartListener(
      index: widget.index,
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Adjust the value as needed
        child: InkWell(
          child: Material(
            color: tileColor,
            elevation: 5.0,
            child: ListTile(
              onLongPress: () => appData.deleteTask(widget.index),
              title: Row(
                children: [
                  Expanded(
                    child: EditableTextField(appData: appData, index: widget.index, isTitle: false,),
                  ),
                  Checkbox(
                    value: task.status,
                    onChanged: (value) {
                      appData.changeTaskStatus(widget.index);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
