import 'package:diagnostics/constants/appearance_constants.dart' as appearance_constants;
import 'package:diagnostics/controllers/doctors_controller.dart';
import 'package:diagnostics/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class MyAllDoctorsSelectField extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController controller;

  const MyAllDoctorsSelectField({Key? key, required this.title, required this.hint, required this.controller})
      : super(key: key);

  @override
  State<MyAllDoctorsSelectField> createState() => _MyAllDoctorsSelectFieldState();
}

class _MyAllDoctorsSelectFieldState extends State<MyAllDoctorsSelectField> {
  late FocusNode focusNode;
  late FocusAttachment nodeAttachment;
  bool focused = false;
  Color borderColor = Colors.grey;
  double borderWidth = 1.0;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode(debugLabel: 'TextField');
    focusNode.addListener(handleFocusChange);
    nodeAttachment = focusNode.attach(context);
  }

  void handleFocusChange() {
    if (focusNode.hasFocus != focused) {
      setState(() {
        focused = focusNode.hasFocus;
        borderColor = Colors.grey;
        borderWidth = 1.0;

        if (focused) {
          borderColor = appearance_constants.primarySwatch;
          borderWidth = 3.0;
        }
      });
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(handleFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DoctorsController doctorsServiceController = Get.find();
    nodeAttachment.reparent();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: inputTextTitleTextStyle,
        ),
        Container(
          height: 42,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: borderWidth), borderRadius: BorderRadius.circular(12)),
          child: TypeAheadField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                focusNode: focusNode,
                autofocus: true,
                style: inputTextSubTitleTextStyle,
                decoration: const InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: '',
                ),
                controller: widget.controller,
              ),
              suggestionsCallback: (pattern) async {
                doctorsServiceController.getNameSuggestions(pattern);
                return doctorsServiceController.resultNameSuggestions;
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                widget.controller.text = suggestion;
              }),
        ),
      ],
    );
  }
}
