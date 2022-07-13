import 'dart:io';

import 'package:diagnostics/interfaces/i_my_file_input_field.dart';
import 'package:diagnostics/ui/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class MyFileInputField extends StatefulWidget {
  final String title;
  final String hint;
  final IMyFileInputField controller;

  const MyFileInputField({Key? key, required this.title, required this.hint, required this.controller})
      : super(key: key);

  @override
  State<MyFileInputField> createState() => _MyFileInputFieldState();
}

class _MyFileInputFieldState extends State<MyFileInputField> {
  Color borderColor = Colors.grey;
  double borderWidth = 1.0;

  List<File> files = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: inputTextTitleTextStyle,
        ),
        Container(
          height: 100,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: borderWidth), borderRadius: BorderRadius.circular(12)),
          child: Column(children: [getHeader(context), getSelectedFiles(context)]),
        ),
      ],
    );
  }

  Widget getHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '',
            style: inputTextTitleTextStyle,
          ),
        ),
        IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.attach_file_outlined, color: Colors.grey),
            onPressed: () async {
              files.addAll(await getFileFromUser(context));
              setState(() {});
            }),
      ],
    );
  }

  Widget getSelectedFiles(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: files.length,
            itemBuilder: (context, index) {
              return Text(basename(files[index].path));
            }));
  }

  Future<List<File>> getFileFromUser(BuildContext context) async {
    List<File> files = List.empty();
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
    }

    return files;
  }
}
