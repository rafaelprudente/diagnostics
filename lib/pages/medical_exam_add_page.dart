import 'package:diagnostics/constants/label_constants.dart' as label_constants;
import 'package:diagnostics/services/doctors_service.dart';
import 'package:diagnostics/widgets/navigation_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class MedicalExamAddPage extends StatefulWidget {
  const MedicalExamAddPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MedicalExamAddPage> createState() => _MedicalExamAddPageState();
}

class _MedicalExamAddPageState extends State<MedicalExamAddPage> {
  final DoctorsService doctorsService = Get.find();
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: const InputDecoration(labelText: label_constants.labelFieldDoctors),
                    controller: _typeAheadController,
                  ),
                  suggestionsCallback: (pattern) async {
                    return await doctorsService.getSuggestions(pattern);
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  itemBuilder: (context, suggestion) {
                    if (kDebugMode) {
                      print(suggestion);
                    }
                    return
                      ListTile(
                      title: Text(suggestion as String),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _typeAheadController.text = '';
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
