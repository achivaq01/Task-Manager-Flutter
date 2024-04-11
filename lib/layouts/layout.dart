import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:untitled/widgets/header.dart';
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
    SidebarXController sidebarXController =
        SidebarXController(selectedIndex: 0);
    double contextWidth = MediaQuery.sizeOf(context).width;
    double contextHeight = MediaQuery.sizeOf(context).height;

    double taskListWidth = contextWidth;
    double taskListHeight = contextHeight * 0.8;

    switch (appData.views) {
      default:
        return Scaffold(
          body: Column(
            children: [
              const Header(title: "Title!", titleSize: 20),
              LinearProgressIndicator(
                value: appData.tasks.isNotEmpty
                    ? appData.taskCompletionProgress()
                    : 0,
                color: Colors.blue,
                backgroundColor: appData.theme.cardColor,
              ),
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
