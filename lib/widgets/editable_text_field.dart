import 'package:flutter/material.dart';

class EditableTextField extends StatefulWidget {
  String text;
  EditableTextField({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => EditableTextFieldState();
}

class EditableTextFieldState extends State<EditableTextField> {
  bool isEditingText = false;
  TextEditingController? editingController;
  String text = "AAAAAAAAAAa";

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(text: text);
  }

  @override
  void dispose() {
    editingController ?? dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
