import 'package:flutter/material.dart';

import '../classes/app_data.dart';

class EditableTextField extends StatefulWidget {
  final AppData appData;
  final int index;
  const EditableTextField({super.key, required this.appData, required this.index});

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
    String text = widget.appData.tasks[widget.index].name;
    if (isEditingText) {
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              text = newValue;
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
          isEditingText = true;
        },
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ));
  }
}
