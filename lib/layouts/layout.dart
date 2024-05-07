import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/editable_text_field.dart';
import 'package:untitled/widgets/new_task_button.dart';
import 'package:untitled/widgets/task_list.dart';

import '../classes/app_data.dart';
import '../constants.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<StatefulWidget> createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    double contextWidth = MediaQuery.of(context).size.width;
    double contextHeight = MediaQuery.of(context).size.height;

    double taskListWidth = contextWidth;
    double taskListHeight = contextHeight * 0.8;

    switch (appData.views) {
      default:
        return Scaffold(
          body: Column(
            children: [
              Padding(padding: const EdgeInsets.all(20), child: EditableTextField(appData: appData, index: 0, isTitle: true,),),
              LinearProgressIndicator(
                value: appData.tasks.isNotEmpty
                    ? appData.taskCompletionProgress()
                    : 0,
                color: Colors.deepPurple,
                backgroundColor: appData.theme.cardColor,
              ),
              Expanded(
                child: SizedBox(
                  width: taskListWidth,
                  height: taskListHeight,
                  child: const TaskList(),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 30), child: SizedBox(
                  width: newTaskButtonDimensions,
                  height: newTaskButtonDimensions,
                  child: NewTaskButton())
              )
            ],
          ),
        );
    }
  }
}
