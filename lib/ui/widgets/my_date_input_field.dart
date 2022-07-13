import 'dart:io';

import 'package:diagnostics/constants/application_constants.dart' as application_constants;
import 'package:diagnostics/interfaces/i_my_date_input_field.dart';
import 'package:diagnostics/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateInputField extends StatefulWidget {
  final String title;
  final IMyDateInputField controller;

  const MyDateInputField({Key? key, required this.title, required this.controller}) : super(key: key);

  @override
  State<MyDateInputField> createState() => _MyDateInputFieldState();
}

class _MyDateInputFieldState extends State<MyDateInputField> {
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
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: false,
                  focusNode: focusNode,
                  controller: internalController,
                  style: inputTextSubTitleTextStyle,
                  decoration: InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintText: DateFormat.yMd(Platform.localeName).format(widget.controller.date ?? DateTime.now()),
                    hintStyle: inputTextSubTitleTextStyle,
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.calendar_today_outlined, color: Colors.grey),
                onPressed: () async {
                  widget.controller.date = (await getDateTimeFromUser(context))!;
                  internalController.text =
                      DateFormat.yMd(Platform.localeName).format(widget.controller.date ?? DateTime.now());
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

Future<DateTime?> getDateTimeFromUser(BuildContext context) async {
  return await showDatePicker(
      context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(3000));
}
