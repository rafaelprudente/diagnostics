import 'package:diagnostics/constants/application_constants.dart' as application_constants;
import 'package:diagnostics/controllers/doctors_rest_controller.dart';
import 'package:diagnostics/interfaces/i_my_all_doctors_select_field.dart';
import 'package:diagnostics/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class MyAllDoctorsSelectField extends StatefulWidget {
  final String title;
  final String hint;
  final IMyAllDoctorsSelectField controller;

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
  TextEditingController internalController = TextEditingController();

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
          borderColor = application_constants.primaryColor;
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
    final DoctorsRestController doctorsServiceController = Get.find();
    nodeAttachment.reparent();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: inputTextTitleTextStyle,
        ),
        Container(
          height: 46,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: borderWidth), borderRadius: BorderRadius.circular(12)),
          child: TypeAheadFormField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                focusNode: focusNode,
                autofocus: true,
                style: inputTextSubTitleTextStyle,
                decoration: const InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: '',
                ),
                controller: internalController,
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
                internalController.text = suggestion;
                widget.controller.doctor = suggestion;
              }),
        ),
      ],
    );
  }
}
