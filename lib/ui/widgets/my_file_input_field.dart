import 'dart:io';

import 'package:diagnostics/ui/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class MyFileInputField extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  const MyFileInputField({Key? key, required this.title, required this.controller}) : super(key: key);

  @override
  State<MyFileInputField> createState() => _MyFileInputFieldState();
}

class _MyFileInputFieldState extends State<MyFileInputField> {
  List<File> files = [];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: inputTextTitleTextStyle,
            ),
          ),
          IconButton(
              icon: const Icon(Icons.attach_file_outlined, color: Colors.grey),
              onPressed: () async {
                List<File> selectedFiles = await getFileFromUser(context);
                files.addAll(selectedFiles);
                setState(() {});
              })
        ],
      ),
      Container(
        //height: 52,
        padding: const EdgeInsets.only(left: 14),
        margin: const EdgeInsets.only(top: 8.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: 1.0), borderRadius: BorderRadius.circular(12)),
        child: Expanded(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                itemCount: files.length,
                itemBuilder: (BuildContext context, int index) {
                  File file = files[index];
                  return ListTile(title: Text(basename(file.path)));
                })),
      ),
    ]);
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
