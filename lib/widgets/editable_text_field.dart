import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/app_data.dart';

class EditableTextField extends StatefulWidget {
  final AppData appData;
  final int index;
  final bool isTitle; // New parameter

   const EditableTextField(
      {super.key, required this.appData, required this.index, required this.isTitle}); // super.key changed to key

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
    editingController?.dispose(); // Corrected dispose method call
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    final bool isTitle = widget.isTitle;

    final String textToShow = isTitle ? appData.title : appData.tasks[widget.index].name; // Updated logic

    if (isEditingText) {
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              if (!isTitle) {
                appData.tasks[widget.index].name = newValue;
              } else {
                appData.title = newValue;
                appData.forceNotifyListeners();
              }
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
          editingController?.text = textToShow; // Using textToShow instead of appData.tasks[widget.index].name
          isEditingText = true;
        });
      },
      child: Text(
        textToShow,
        style: TextStyle(
          color: appData.theme.unselectedWidgetColor,
          fontSize: isTitle ? 30 : 18.0,
        ),
      ),
    );
  }
}
