import 'dart:io';

import 'package:diagnostics/constants/label_constants.dart' as label_constants;
import 'package:diagnostics/controllers/doctors_controller.dart';
import 'package:diagnostics/ui/styles.dart';
import 'package:diagnostics/ui/widgets/my_all_doctors_select_field.dart';
import 'package:diagnostics/ui/widgets/my_button.dart';
import 'package:diagnostics/ui/widgets/my_date_input_field.dart';
import 'package:diagnostics/ui/widgets/my_file_input_field.dart';
import 'package:diagnostics/ui/widgets/my_navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MedicalExamAddPage extends StatefulWidget {
  const MedicalExamAddPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MedicalExamAddPage> createState() => _MedicalExamAddPageState();
}

class _MedicalExamAddPageState extends State<MedicalExamAddPage> {
  final DoctorsController doctorsController = Get.find();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController doctorTextEditingController = TextEditingController();
  final TextEditingController dateTextEditingController = TextEditingController();
  final TextEditingController filesTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyNavigationDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('New Medical Exam', style: headingTextStyle),
              MyAllDoctorsSelectField(
                  title: label_constants.labelFieldDoctors, hint: '', controller: doctorTextEditingController),
              MyDateInputField(
                title: "Date",
                hint: DateFormat.yMd(Platform.localeName).format(DateTime.now()),
                controller: dateTextEditingController,
              ),
              MyFileInputField(title: "Exam files", hint: '', controller: filesTextEditingController),
              MyButton(label: 'Gravar', onTap: () => null),
            ],
          ),
        ),
      ),
    );
  }

  validateForm() {
    if (true) {}
  }
}
