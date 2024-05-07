import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/task_tile.dart';

import '../classes/app_data.dart';
import '../classes/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<StatefulWidget> createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);

    return ReorderableListView.builder(
        buildDefaultDragHandles: false,
        itemBuilder: (context, index) => TaskTile(
            key: Key('$index'), task: appData.tasks[index], index: index),

        itemCount: appData.tasks.length,
        shrinkWrap: true,
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Task task = appData.tasks.removeAt(oldIndex);
            appData.tasks.insert(newIndex, task);
          });
        });
  }
}
