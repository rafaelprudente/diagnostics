import 'dart:io';

import 'package:diagnostics/constants/appearance_constants.dart' as appearance_constants;
import 'package:diagnostics/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateInputField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;

  const MyDateInputField({Key? key, required this.title, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: inputTextTitleTextStyle,
        ),
        Container(
          height: 52,
          padding: const EdgeInsets.only(left: 14),
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0), borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  autofocus: false,
                  controller: controller,
                  style: inputTextSubTitleTextStyle,
                  decoration: InputDecoration(
                      hintText: DateFormat.yMd(Platform.localeName).format(DateTime.now()),
                      hintStyle: inputTextSubTitleTextStyle,
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: appearance_constants.primarySwatch, width: 0))),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today_outlined, color: Colors.grey),
                onPressed: () async {
                  DateTime? selectedDate = await getDateTimeFromUser(context);
                  controller!.text = DateFormat.yMd(Platform.localeName).format(selectedDate ?? DateTime.now());
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
