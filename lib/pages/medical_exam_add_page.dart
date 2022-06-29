import 'package:diagnostics/constants/label_constants.dart' as label_constants;
import 'package:diagnostics/controllers/doctors_controller.dart';
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
  final DoctorsController doctorsController = Get.find();
  final DoctorsService doctorsService = Get.find();
  final TextEditingController _typeAheadController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var date =
            "${picked
            .toLocal()
            .day}/${picked
            .toLocal()
            .month}/${picked
            .toLocal()
            .year}";
        _dateController.text = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    TypeAheadField<String?>(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: const InputDecoration(labelText: label_constants.labelFieldDoctors),
                          controller: _typeAheadController,
                        ),
                        suggestionsCallback: (pattern) async {
                          doctorsController.getNameSuggestions(pattern);
                          return doctorsController.resultNameSuggestions;
                        },
                        transitionBuilder: (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion!),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _typeAheadController.text = suggestion!;
                        }),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          onSaved: (val) {
                            //task.date = selectedDate;
                          },
                          controller: _dateController,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            labelText: "Date",
                            icon: Icon(Icons.calendar_today),
                          ),
                          validator: (value) {
                            //if (value.isEmpty) {
                            //  return "Please enter a date for your task";
                            //}
                            return null;
                          },
                        ),),
                    ),
                    TextButton(
                      child: const Text("Submit"),
                      onPressed: () {
                        //if (_formKey.currentState.validate()) {
                        //  _formKey.currentState.save();
                        //}
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

/*
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
              TypeAheadField<String?>(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: const InputDecoration(labelText: label_constants.labelFieldDoctors),
                    controller: _typeAheadController,
                  ),
                  suggestionsCallback: (pattern) async {
                    doctorsController.getNameSuggestions(pattern);
                    return doctorsController.resultNameSuggestions;
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion!),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _typeAheadController.text = suggestion!;
                  }),
            ],
          ),
        ),
      ),
    );
  }
  */
}
