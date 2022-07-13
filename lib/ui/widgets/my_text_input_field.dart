import 'package:diagnostics/constants/application_constants.dart' as application_constants;
import 'package:diagnostics/ui/styles.dart';
import 'package:flutter/material.dart';

class MyTextInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const MyTextInputField({Key? key, required this.title, required this.hint, this.controller, this.widget})
      : super(key: key);

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
          child: Expanded(
            child: TextFormField(
              autofocus: false,
              controller: controller,
              style: inputTextSubTitleTextStyle,
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: inputTextSubTitleTextStyle,
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: application_constants.primaryColor, width: 0))),
            ),
          ),
        ),
      ],
    );
  }
}
