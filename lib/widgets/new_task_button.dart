import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/app_data.dart';
import '../classes/task.dart';

class NewTaskButton extends StatefulWidget {
  const NewTaskButton({super.key});

  @override
  State<StatefulWidget> createState() => NewTaskButtonState();
}


class NewTaskButtonState extends State<NewTaskButton> {

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);

    return RawMaterialButton(
      onPressed: () {
        Task newTask = Task(name: "New task");
        appData.tasks.add(newTask);
        appData.forceNotifyListeners();
      },
      elevation: 2.0,
      fillColor: appData.theme.secondaryHeaderColor,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add
      ),

    );
  }

}