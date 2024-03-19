import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/task_tile.dart';

import '../classes/app_data.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<StatefulWidget> createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    final List<int> items = List<int>.generate(50, (int index) => index);

    /*
    return ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 300),
        children: <Widget>[
          for (int index = 0; index < items.length; index++)
            ListTile(
              key: Key('$index'),
              tileColor: appData.theme.cardColor,
              title: const Text('test'),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        });
     */

    return ReorderableListView.builder(
        itemBuilder: (context, index) => TaskTile(
            key: Key('$index'),
            task: appData.tasks[index],
            onChanged: (value) =>
                appData.changeTaskStatus(index), index: index),
        itemCount: appData.tasks.length,
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        });
  }
}
