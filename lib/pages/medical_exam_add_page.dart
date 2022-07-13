import 'package:diagnostics/constants/label_constants.dart' as label_constants;
import 'package:diagnostics/controllers/medical_exam_add_controller.dart';
import 'package:diagnostics/ui/styles.dart';
import 'package:diagnostics/ui/widgets/my_all_doctors_select_field.dart';
import 'package:diagnostics/ui/widgets/my_button.dart';
import 'package:diagnostics/ui/widgets/my_date_input_field.dart';
import 'package:diagnostics/ui/widgets/my_file_input_field.dart';
import 'package:diagnostics/ui/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

class MedicalExamAddPage extends StatefulWidget {
  const MedicalExamAddPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MedicalExamAddPage> createState() => _MedicalExamAddPageState();
}

class _MedicalExamAddPageState extends State<MedicalExamAddPage> {
  MedicalExamAddController holdController = Get.put(MedicalExamAddController());

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: widget.title,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Text('New Medical Exam', style: headingTextStyle),
        MyAllDoctorsSelectField(title: label_constants.labelFieldDoctors, hint: '', controller: holdController),
        MyDateInputField(title: 'Date', controller: holdController),
        MyFileInputField(title: "Exam Files", hint: '', controller: holdController),
        MyButton(label: 'Save', onTap: () => holdController.validateForm(context)),
      ],
    );
  }
}
