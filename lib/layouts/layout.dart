import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
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
    double contextWidth = MediaQuery.sizeOf(context).width;
    double contextHeight = MediaQuery.sizeOf(context).height;

    double taskListWidth = contextWidth;
    double taskListHeight = contextHeight * 0.8;

    switch (appData.views) {

      default:
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                width: taskListWidth,
                height: taskListHeight,
                child: const TaskList(),
              ),
              const SizedBox(
                width: newTaskButtonDimensions,
                height: newTaskButtonDimensions,
                child: NewTaskButton(),
              )
            ],
          ),
        );
    }
  }

}