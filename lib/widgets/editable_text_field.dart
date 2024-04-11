import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/app_data.dart';

class EditableTextField extends StatefulWidget {
  final AppData appData;
  final int index;

  const EditableTextField(
      {super.key, required this.appData, required this.index});

  @override
  State<StatefulWidget> createState() => EditableTextFieldState();
}

class EditableTextFieldState extends State<EditableTextField> {
  bool isEditingText = false;
  TextEditingController? editingController;

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    editingController ?? dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);

    if (isEditingText) {
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              appData.tasks[widget.index].name = newValue;
              isEditingText = false;
            });
          },
          autofocus: true,
          controller: editingController,
        ),
      );
    }
    return InkWell(
        onTap: () {
          setState(() {
            editingController?.text = appData.tasks[widget.index].name;
            isEditingText = true;
          });
        },
        child: Text(
          appData.tasks[widget.index].name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ));
  }
}
