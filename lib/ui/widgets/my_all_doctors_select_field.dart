import 'package:diagnostics/constants/appearance_constants.dart' as appearance_constants;
import 'package:diagnostics/controllers/doctors_controller.dart';
import 'package:diagnostics/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class MyAllDoctorsSelectField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;

  const MyAllDoctorsSelectField({Key? key, required this.title, required this.hint, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DoctorsController doctorsServiceController = Get.find();

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
          child: TypeAheadField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                autofocus: true,
                style: inputTextSubTitleTextStyle,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: appearance_constants.primarySwatch, width: 0))),
                controller: controller,
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
                controller.text = suggestion;
              }),
        ),
      ],
    );
  }
}
