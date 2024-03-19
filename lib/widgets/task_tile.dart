import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/classes/task.dart';
import 'package:untitled/widgets/editable_text_field.dart';

import '../classes/app_data.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final ValueChanged<bool?>? onChanged;
  const TaskTile({super.key, required this.task, required this.onChanged});


  @override
  State<StatefulWidget> createState() => TaskTileStatus();
}

class TaskTileStatus extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    Task task = widget.task;

    return InkWell(
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged!(!widget.task.finished);
        }
      },
      child: ListTile(
        title: Row(
          children: [
            Expanded(
                child: EditableTextField(text: '',),
            ),
            Checkbox(value: task.finished, onChanged: widget.onChanged)
          ],
        ),
      ),
    );
  }

}